import 'package:flutter/material.dart';
import 'package:flutter_archive/application/context.dart';
import 'package:flutter_archive/domain/book.dart';
import 'package:flutter_archive/domain/book_service.dart';
import 'package:flutter_archive/widgets/books/book_preview.dart';

class BookList extends StatefulWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  BookService _bookService = getIt<BookService>();

  late Future<List<Book>> _booksFuture;

  @override
  void initState(){
    super.initState();
    _booksFuture = _bookService.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    print("Rendering BookList");
    return FutureBuilder(
        future: _booksFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var books = snapshot.data!;
            return ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return BookPreview(book: books[index], onDelete: deleteBook);
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return CircularProgressIndicator();
        });
  }

  deleteBook(Book book) async{
    await _bookService.deleteBook(book);
    setState(() {
      _booksFuture = _bookService.getBooks();
    });
  }
}
