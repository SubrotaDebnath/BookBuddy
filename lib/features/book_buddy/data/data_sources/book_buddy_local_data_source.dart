import 'package:book_buddy/core/db/book_buddy_db.dart';
import 'package:book_buddy/features/book_buddy/data/models/book_model.dart';

abstract class BookBuddyLocalDataSource {
  Future<List<BookModel>> getAllFavoriteBooks();

  Future<List<BookModel>> deleteFormFavourite({required String bookId});

  Future<List<BookModel>> insertToFavourite({required BookModel book});
}

class BookBuddyLocalDataSourceImpl extends BookBuddyLocalDataSource {
  final BookDatabase db;

  BookBuddyLocalDataSourceImpl({required this.db});

  @override
  Future<List<BookModel>> getAllFavoriteBooks() async {
    return await db.getAllBooks();
  }

  @override
  Future<List<BookModel>> deleteFormFavourite({required String bookId}) async {
    await db.deleteBook(bookId);
    return await db.getAllBooks();

  }

  @override
  Future<List<BookModel>> insertToFavourite({required BookModel book}) async {
     await db.insertBook(book);
     return await db.getAllBooks();
  }
}
