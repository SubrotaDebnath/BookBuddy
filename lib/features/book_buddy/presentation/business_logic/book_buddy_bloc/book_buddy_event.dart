part of 'book_buddy_bloc.dart';

sealed class BookBuddyEvent extends Equatable {
  const BookBuddyEvent();
}

class BookBuddyEventFetchBooks extends BookBuddyEvent {
  final BooksParams booksParams;
  final BooksEntity? previousBooksEntity;
  final double currentScrollPosition;

  const BookBuddyEventFetchBooks({
    required this.booksParams,
    this.previousBooksEntity,
    required this.currentScrollPosition,
  });

  @override
  List<Object?> get props => [
    booksParams,
    previousBooksEntity,
    currentScrollPosition,
  ];
}
