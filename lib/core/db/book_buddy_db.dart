import 'package:book_buddy/features/book_buddy/data/models/book_db_model.dart';
import 'package:book_buddy/features/book_buddy/data/models/book_model.dart';
import 'package:hive_flutter/adapters.dart';

class BookDatabase {
  late Box<Book> bookBox;

  Future<void> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(BookAdapter());
    Hive.registerAdapter(VolumeInfoAdapter());
    Hive.registerAdapter(ImageLinksAdapter());

    bookBox = await Hive.openBox<Book>('booksBox');
    print('Hive initialized and box opened!');

  }

  Future<void> insertBook(BookModel book) async {
    final hiveBook = book.toHive();
    await bookBox.put(book.id, hiveBook);
  }

  Future<List<BookModel>> getAllBooks() async {
    final books = bookBox.values.toList();
    return books.map((hiveBook) => BookModel.fromHive(hiveBook)).toList();
  }

  Future<void> deleteBook(String id) async {
    await bookBox.delete(id);
  }

  Future<void> closeHive() async {
    await bookBox.close();
  }
}
