import 'package:book_buddy/features/book_buddy/data/data_sources/book_buddy_local_data_source.dart';
import 'package:book_buddy/features/book_buddy/data/data_sources/book_buddy_remote_data_source.dart';
import 'package:book_buddy/features/book_buddy/data/repositories/book_buddy_repository_impl.dart';
import 'package:book_buddy/features/book_buddy/domain/repositories/book_buddy_repository.dart';
import 'package:book_buddy/features/book_buddy/domain/use_cases/add_to_favorite.dart';
import 'package:book_buddy/features/book_buddy/domain/use_cases/delete_form_favorite.dart';
import 'package:book_buddy/features/book_buddy/domain/use_cases/get_all_favorite_books.dart';
import 'package:book_buddy/features/book_buddy/domain/use_cases/get_books.dart';
import 'package:book_buddy/features/book_buddy/presentation/business_logic/book_buddy_bloc/book_buddy_bloc.dart';
import 'package:book_buddy/features/book_buddy/presentation/business_logic/favorite_book_bloc/favourite_book_bloc.dart';
import 'package:get_it/get_it.dart';

void bookBuddyRegister(GetIt sl) {
  sl
    //bloc
    ..registerFactory(() => BookBuddyBloc(getBooks: sl<GetBooks>()))
    ..registerFactory(
      () => FavouriteBookBloc(
        addToFavorite: sl<AddToFavorite>(),
        getAllFavoriteBooks: sl<GetAllFavoriteBooks>(),
        deleteFormFavorite: sl<DeleteFormFavorite>(),
      ),
    )
    // Use Cases
    ..registerLazySingleton(() => GetBooks(bookBuddyRepository: sl()))
    ..registerLazySingleton(() => AddToFavorite(bookBuddyRepository: sl()))
    ..registerLazySingleton(() => DeleteFormFavorite(bookBuddyRepository: sl()))
    ..registerLazySingleton(
      () => GetAllFavoriteBooks(bookBuddyRepository: sl()),
    )
    //Repositories
    ..registerLazySingleton<BookBuddyRepository>(
      () => BookBuddyRepositoryImpl(
        bookBuddyRemoteDataSource: sl<BookBuddyRemoteDataSource>(),
        bookBuddyLocalDataSource: sl<BookBuddyLocalDataSource>(),
      ),
    )
    //Data Sources
    // remote
    ..registerLazySingleton<BookBuddyRemoteDataSource>(
      () => BookBuddyRemoteDataSourceImpl(client: sl()),
    )
    //Local
    ..registerLazySingleton<BookBuddyLocalDataSource>(
      () => BookBuddyLocalDataSourceImpl(db: sl()),
    ); // Lazy Singleton for BookDatabase
}
