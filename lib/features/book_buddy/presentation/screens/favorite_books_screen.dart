import 'package:book_buddy/features/book_buddy/domain/entities/books_entity.dart';
import 'package:book_buddy/features/book_buddy/presentation/business_logic/favorite_book_bloc/favourite_book_bloc.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/books_loading_view.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/common_app_bar.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/empty_books_view.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/favourite_books_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBooksScreen extends StatefulWidget {
  const FavoriteBooksScreen({super.key});

  @override
  State<FavoriteBooksScreen> createState() => _FavoriteBooksScreenState();
}

class _FavoriteBooksScreenState extends State<FavoriteBooksScreen> {
  @override
  void initState() {
    context.read<FavouriteBookBloc>().add(FavouriteBookEventGetAll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'My Favorites'),
      body: Column(
        children: [
          BlocConsumer<FavouriteBookBloc, FavouriteBookState>(
            listener: (context, favState) {},
            builder: (context, favState) {
              if (favState is FavouriteBookLoaded) {
                if (favState.books.isEmpty) {
                  return EmptyBooksView(
                    message:
                        'Nothing here yet! Tap the heart icon to save your favorite items.',
                  );
                }
                return FavouriteBooksBodyView(
                  booksEntity: BooksEntity(
                    kind: 'Favourites',
                    totalItems: 0,
                    items: favState.books,
                  ),

                );
              }
              return BooksLoadingView();
            },
          ),
        ],
      ),
    );
  }
}
