import 'package:book_buddy/features/book_buddy/presentation/routing/route_names.dart';
import 'package:flutter/material.dart';

class BooksAppBarView extends StatelessWidget implements PreferredSizeWidget {
  const BooksAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('BookBuddy'),
      centerTitle: true,
      // backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {
            //TODO: Navigate to Favorite Screen
            Navigator.pushNamed(context, RouteNames.kFavoriteBooksScreen);
          },
          icon: const Icon(Icons.favorite_outlined, color: Colors.red),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
