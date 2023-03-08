import 'package:flutter_archive/domain/book.dart';
import 'package:flutter_archive/domain/book_service.dart';

class BookServiceMock extends BookService {
  var bookList = {
    "Hello World": Book("Hello World"),
    "A History of Orcs": Book("A History of Orcs"),
    "Goodbye and thanks for all the fish":
        Book("Goodbye and thanks for all the fish")
  };

  @override
  Future<List<Book>> getBooks() async {
    await Future.delayed(Duration(seconds: 1));
    return List.of(bookList.values);
  }

  @override
  Future<Book> getBookByTitle(String title) async{
    await Future.delayed(Duration(seconds: 1));
    if(bookList.containsKey(title)){
      return bookList[title]!;
    }
    throw "Not found";
  }

  @override
  Future<void> deleteBook(Book book) async {
    print("Deleting ${book.title} from Mock");
    bookList.remove(book.title);
    print("Bookslist is now ${bookList.length} long");
  }
}
