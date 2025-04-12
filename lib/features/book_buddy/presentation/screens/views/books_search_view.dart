import 'package:book_buddy/core/params/books_params.dart';
import 'package:book_buddy/features/book_buddy/presentation/business_logic/book_buddy_bloc/book_buddy_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookSearchView extends StatelessWidget {
  const BookSearchView({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    void initiateSearch() {
      // Prevent Search with empty query parameter
      if (searchController.text.trim().isEmpty) {
        return;
      }
      BooksParams booksParams = BooksParams(
        queryParam: searchController.text.trim().toLowerCase(),
        startIndex: 0,
      );

      context.read<BookBuddyBloc>().add(
        BookBuddyEventFetchBooks(
          booksParams: booksParams,
          currentScrollPosition: 0,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextFormField(
        controller: searchController,
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (value) {
          initiateSearch();
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
            hintText: 'Search book',
            suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              initiateSearch();
            },
          ),
        ),
      ),
    );
  }
}
