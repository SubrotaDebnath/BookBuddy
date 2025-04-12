import 'package:book_buddy/core/error/failure.dart';
import 'package:book_buddy/core/params/books_params.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/book_entity.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/books_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class BookBuddyRepository {
  Future<Either<Failure, BooksEntity>> getBooks({
    required BooksParams booksParams,
  });

  Future<Either<Failure, List<BookEntity>>> getAllFavoriteBooks();

  Future<Either<Failure, List<BookEntity>>> insertFavoriteBooks({
    required BookEntity book,
  });

  Future<Either<Failure, List<BookEntity>>> deleteFavoriteBooks({
    required String bookId,
  });
}
