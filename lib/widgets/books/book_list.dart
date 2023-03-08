import 'package:flutter/material.dart';
import 'package:flutter_archive/application/context.dart';
import 'package:flutter_archive/domain/book.dart';
import 'package:flutter_archive/domain/book_service.dart';
import 'package:flutter_archive/widgets/books/book_preview.dart';

class BookList extends StatelessWidget with ChangeNotifier {
  BookService _bookService = getIt<BookService>();

  @override
  Widget build(BuildContext context) {
    print("Rendering BookList");
    Future<List<Book>> bookFuture = _bookService.getBooks();
    return FutureBuilder(
        future: bookFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var books = snapshot.data!;
            return ListView.builder(
                itemCount: books.length*100,
                itemBuilder: (context, index) {
                  return BookPreview(book: books[index%3]);
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return CircularProgressIndicator();
        });
  }

  deleteBook(Book book){
    _bookService.deleteBook(book);
    notifyListeners();
  }
}