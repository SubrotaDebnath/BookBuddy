import 'dart:async';

import 'package:book_buddy/core/error/failure.dart';
import 'package:book_buddy/core/params/books_params.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/book_entity.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/books_entity.dart';
import 'package:book_buddy/features/book_buddy/domain/use_cases/get_books.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_buddy_event.dart';

part 'book_buddy_state.dart';

class BookBuddyBloc extends Bloc<BookBuddyEvent, BookBuddyState> {
  BookBuddyBloc({required this.getBooks})
    : super(BookBuddyInitial()) {
    on<BookBuddyEventFetchBooks>(_onBookBuddyEventFetchBooks);
  }

  final GetBooks getBooks;

  Future<void> _onBookBuddyEventFetchBooks(
    BookBuddyEventFetchBooks event,
    Emitter<BookBuddyState> emit,
  ) async {
    if (event.previousBooksEntity == null) {
      emit(BookBuddyInitial());
    }

    // final favoriteResult = await getAllFavoriteBooks.call(
    //   params: EmptyParams(),
    // );

    // List<BookEntity> favoriteBooks = [];
    // favoriteResult.fold(
    //   (l) {
    //     favoriteBooks = [];
    //   },
    //   (r) {
    //     favoriteBooks = r;
    //   },
    // );

    final result = await getBooks(params: event.booksParams);

    result.fold(
      (l) {
        switch (l) {
          case ConnectionFailure connectionerror:
            return emit(BookBuddyInternetConnectionError(message: l.message));
          // case ServerFailure serverFailure:
          // return emit(BookBuddyError(l.message));
          default:
            return emit(BookBuddyError(message: l.message));
        }
      },
      (r) {
        // if (favoriteBooks.isNotEmpty) {}

        if (event.previousBooksEntity == null) {
          emit(
            BookBuddyDataLoaded(
              booksEntity: r,
              booksParams: event.booksParams,
              currentScrollPosition: event.currentScrollPosition,
            ),
          );
        } else {
          List<BookEntity> previousItems = event.previousBooksEntity!.items;
          List<BookEntity> newItems = [...previousItems, ...r.items];
          BooksEntity mergedBooksData = event.previousBooksEntity!.copyWith(
            items: newItems,
          );

          // final aggregateBookData = mergingBooksWithFavouriteBooks(books: mergedBooksData,favouriteBooks: favoriteBooks);

          emit(
            BookBuddyDataLoaded(
              // booksEntity: aggregateBookData,
              booksEntity: mergedBooksData,
              booksParams: event.booksParams,
              currentScrollPosition: event.currentScrollPosition,
            ),
          );
        }
      },
    );
  }

  // BooksEntity mergingBooksWithFavouriteBooks({
  //   required BooksEntity books,
  //   required List<BookEntity> favouriteBooks,
  // }) {
  //   if (favouriteBooks.isEmpty) {
  //     return books;
  //   }
  //
  //   List<BookEntity> mergedBooks = [];
  //
  //
  //   for (final item in books.items) {
  //     for (final book in favouriteBooks) {
  //       if(item.id==book.id){
  //         final newItem = item.copyWith(isAddedToFavourite: true);
  //         mergedBooks.add(item);
  //         continue;
  //       }
  //     }
  //     mergedBooks.add(item);
  //
  //   }
  //
  //   return books.copyWith(items: mergedBooks);
  //
  // }
}
