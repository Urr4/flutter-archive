
import 'package:flutter_archive/domain/book_service.dart';
import 'package:flutter_archive/domain/book_service_mock.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator(){
  getIt.registerLazySingleton<BookService>(() => BookServiceMock());
}