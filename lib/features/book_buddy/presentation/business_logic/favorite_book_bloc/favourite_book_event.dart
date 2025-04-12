part of 'favourite_book_bloc.dart';

sealed class FavouriteBookEvent extends Equatable {
  const FavouriteBookEvent();
}

class FavouriteBookEventInsert extends FavouriteBookEvent {
  final BookEntity bookEntity;

  const FavouriteBookEventInsert({required this.bookEntity});

  @override
  List<Object?> get props => [];
}

class FavouriteBookEventDelete extends FavouriteBookEvent {
  final String bookId;

  const FavouriteBookEventDelete({required this.bookId});

  @override
  List<Object?> get props => [];
}

class FavouriteBookEventGetAll extends FavouriteBookEvent {
  @override
  List<Object?> get props => [];
}
