import 'dart:async';

import 'package:book_buddy/core/params/empty_params.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/book_entity.dart';
import 'package:book_buddy/features/book_buddy/domain/use_cases/add_to_favorite.dart';
import 'package:book_buddy/features/book_buddy/domain/use_cases/delete_form_favorite.dart';
import 'package:book_buddy/features/book_buddy/domain/use_cases/get_all_favorite_books.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_book_event.dart';

part 'favourite_book_state.dart';

class FavouriteBookBloc extends Bloc<FavouriteBookEvent, FavouriteBookState> {
  FavouriteBookBloc({
    required this.addToFavorite,
    required this.getAllFavoriteBooks,
    required this.deleteFormFavorite,
  }) : super(FavouriteBookInitial()) {
    on<FavouriteBookEventInsert>(_onFavouriteBookEventInsert);
    on<FavouriteBookEventGetAll>(_onFavouriteBookEventGetAll);
    on<FavouriteBookEventDelete>(_onFavouriteBookEventDelete);
  }

  final AddToFavorite addToFavorite;
  final GetAllFavoriteBooks getAllFavoriteBooks;
  final DeleteFormFavorite deleteFormFavorite;

  Future<void> _onFavouriteBookEventInsert(
    FavouriteBookEventInsert event,
    Emitter<FavouriteBookState> emit,
  ) async {
    emit(FavouriteBookInitial());

    final result = await addToFavorite.call(params: event.bookEntity);
    result.fold(
      (l) {
        emit(FavouriteBookLoadError(message: l.message));
      },
      (r) {
        emit(FavouriteBookLoaded(books: r));
      },
    );
  }

  Future<void> _onFavouriteBookEventGetAll(
    FavouriteBookEventGetAll event,
    Emitter<FavouriteBookState> emit,
  ) async {
    emit(FavouriteBookInitial());

    final result = await getAllFavoriteBooks.call(params: EmptyParams());

    result.fold(
      (l) {
        emit(FavouriteBookLoadError(message: l.message));
      },
      (r) {
        emit(FavouriteBookLoaded(books: r));
      },
    );
  }

  Future<void> _onFavouriteBookEventDelete(
    FavouriteBookEventDelete event,
    Emitter<FavouriteBookState> emit,
  ) async {
    emit(FavouriteBookInitial());

    final result = await deleteFormFavorite.call(params:event.bookId);

    result.fold(
          (l) {
        emit(FavouriteBookLoadError(message: l.message));
      },
          (r) {
        emit(FavouriteBookLoaded(books: r));
      },
    );
  }
}
