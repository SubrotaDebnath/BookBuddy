import 'package:book_buddy/features/book_buddy/domain/entities/books_entity.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/favourite_book_card_view.dart';
import 'package:flutter/material.dart';

class FavouriteBooksBodyView extends StatelessWidget {
  const FavouriteBooksBodyView({super.key, required this.booksEntity});

  final BooksEntity booksEntity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: booksEntity.items.length ,
        itemBuilder: (context, index) {
          return FavouriteBookCardView(bookEntity: booksEntity.items[index]);
        },
      ),
    );
  }
}
