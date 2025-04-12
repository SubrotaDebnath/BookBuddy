import 'package:book_buddy/core/db/book_buddy_db.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

void commonRegister(GetIt sl) {
  sl
    // External Packages
    ..registerLazySingleton(http.Client.new)
    // DB
    ..registerLazySingleton<BookDatabase>(
      () => BookDatabase(),
    ); // Lazy Singleton for BookDatabase
}
