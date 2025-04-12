part of 'favourite_book_bloc.dart';

sealed class FavouriteBookState extends Equatable {
  const FavouriteBookState();
}

final class FavouriteBookInitial extends FavouriteBookState {
  @override
  List<Object> get props => [];
}

final class FavouriteBookLoaded extends FavouriteBookState {
  final List<BookEntity> books;

  const FavouriteBookLoaded({required this.books});

  @override
  List<Object> get props => [];
}

final class FavouriteBookLoadError extends FavouriteBookState {
  final String message;

  const FavouriteBookLoadError({required this.message});

  @override
  List<Object> get props => [message];
}
