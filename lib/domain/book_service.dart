
import 'book.dart';

abstract class BookService {
  Future<List<Book>> getBooks();

  Future<Book>? getBookByTitle(String title);

  Future<void> deleteBook(Book book);

}