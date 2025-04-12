import 'package:book_buddy/features/book_buddy/domain/entities/book_entity.dart';
import 'package:book_buddy/features/book_buddy/presentation/routing/route_names.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/book_details_screen.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/books_screen.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/favorite_books_screen.dart';
import 'package:book_buddy/core/widgets/navigation_error_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteNames.kRoot:
        return MaterialPageRoute(builder: (_) => const BooksScreen());
      case RouteNames.kBookDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => BookDetailsScreen(bookEntity: args as BookEntity),
        );
      case RouteNames.kFavoriteBooksScreen:
        return MaterialPageRoute(builder: (_) => const FavoriteBooksScreen());

      //Error pages
      default:
        return MaterialPageRoute(builder: (_) => const NavigationErrorScreen());
    }
  }
}
