import 'dart:io';

import 'package:book_buddy/core/error/exception.dart';
import 'package:book_buddy/core/error/failure.dart';
import 'package:book_buddy/core/params/books_params.dart';
import 'package:book_buddy/features/book_buddy/data/data_sources/book_buddy_local_data_source.dart';
import 'package:book_buddy/features/book_buddy/data/data_sources/book_buddy_remote_data_source.dart';
import 'package:book_buddy/features/book_buddy/data/models/book_model.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/book_entity.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/books_entity.dart';
import 'package:book_buddy/features/book_buddy/domain/repositories/book_buddy_repository.dart';
import 'package:fpdart/fpdart.dart';

class BookBuddyRepositoryImpl extends BookBuddyRepository {
  final BookBuddyRemoteDataSource bookBuddyRemoteDataSource;
  final BookBuddyLocalDataSource bookBuddyLocalDataSource;

  BookBuddyRepositoryImpl({
    required this.bookBuddyRemoteDataSource,
    required this.bookBuddyLocalDataSource,
  });

  @override
  Future<Either<Failure, BooksEntity>> getBooks({
    required BooksParams booksParams,
  }) async {
    try {
      return Right(
        await bookBuddyRemoteDataSource.getBooks(booksParams: booksParams),
      );
    } on SocketException {
      return Left(
        ConnectionFailure(
          message:
              'Unable to connect to the internet. Please ensure you have a working network connection.',
        ),
      );
    }
    on ConnectionTimeoutException{
      return Left( ConnectionFailure(message:"The connection has timed out"));
    }
    // on UnauthorizedException {
    //   return Left(
    //     UnauthorizedFailure(
    //       message:
    //           'This area requires authentication. Please sign in or provide the correct credentials to continue.',
    //     ),
    //   );
    // } on BadRequestException {

    // } on ServerException {
    // }
    on ServiceUnavailableException {
      return Left(
        ServerFailure(
          message:
              "We're temporarily unable to handle your request due to maintenance or overload. You should try your request later.",
        ),
      );
    } on ServerTimeoutException {
      return Left(
        ServerFailure(
          message:
              "We're experiencing a delay in getting information. Please try refreshing the page. If the problem persists, please try again later.",
        ),
      );
    } catch (e) {
      return const Left(ServerFailure(message: 'Something went wrong!'));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> deleteFavoriteBooks({
    required String bookId,
  }) async {
    try {
      return Right(
        await bookBuddyLocalDataSource.deleteFormFavourite(bookId: bookId),
      );
    } catch (_) {
      return Left(ConnectionFailure(message: 'Failed to delete book'));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> getAllFavoriteBooks() async {
    try {
      return Right(await bookBuddyLocalDataSource.getAllFavoriteBooks());
    } catch (e) {
      return Left(ConnectionFailure(message: 'Failed to retrieve books'));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> insertFavoriteBooks({
    required BookEntity book,
  }) async {
    try {
      return Right(
        await bookBuddyLocalDataSource.insertToFavourite(
          book: book as BookModel,
        ),
      );
    } catch (_) {
      return Left(ConnectionFailure(message: 'Failed to insert book'));
    }
  }
}
