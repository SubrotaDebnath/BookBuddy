part of 'book_buddy_bloc.dart';

sealed class BookBuddyState extends Equatable {
  const BookBuddyState();
}

final class BookBuddyInitial extends BookBuddyState {
  @override
  List<Object> get props => [];
}

final class BookBuddyDataLoaded extends BookBuddyState {
  final BooksEntity booksEntity;
  final BooksParams booksParams;
  final double currentScrollPosition;

  const BookBuddyDataLoaded({
    required this.booksEntity,
    required this.booksParams,
    required this.currentScrollPosition,
  });

  @override
  List<Object> get props => [booksEntity, booksParams];
}

final class BookBuddyError extends BookBuddyState {
  final String message;

  const BookBuddyError({required this.message});

  @override
  List<Object> get props => [];
}

final class BookBuddyInternetConnectionError extends BookBuddyState {
  final String message;

  const BookBuddyInternetConnectionError({required this.message});

  @override
  List<Object> get props => [];
}
