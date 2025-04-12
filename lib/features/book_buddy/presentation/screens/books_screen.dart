import 'package:book_buddy/core/di/injection_container.dart';
import 'package:book_buddy/core/params/books_params.dart';
import 'package:book_buddy/features/book_buddy/domain/use_cases/get_books.dart';
import 'package:book_buddy/features/book_buddy/presentation/business_logic/book_buddy_bloc/book_buddy_bloc.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/books_app_bar_view.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/books_body_view.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/books_loading_view.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/books_search_view.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/empty_books_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    context.read<BookBuddyBloc>().add(
      BookBuddyEventFetchBooks(
        booksParams: BooksParams(queryParam: 'book', startIndex: 0),
        currentScrollPosition: 0,
      ),
    );

    searchController = TextEditingController();

    super.initState();
  }

  Future<void> _refreshData({required booksParams}) async {
    late BooksParams booksParams;
    if (searchController.text.trim().isNotEmpty) {
      booksParams = BooksParams(
        queryParam: searchController.text.trim().toLowerCase(),
        startIndex: 0,
      );
    } else {
      booksParams = BooksParams(queryParam: 'book', startIndex: 0);
    }
    context.read<BookBuddyBloc>().add(
      BookBuddyEventFetchBooks(
        booksParams: booksParams,
        currentScrollPosition: 0,
      ),
    );
  }

  @override
  void dispose() {
    BookBuddyBloc(getBooks: sl<GetBooks>()).close();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BooksAppBarView(),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            BookSearchView(searchController: searchController),
            SizedBox(height: 24),

            BlocConsumer<BookBuddyBloc, BookBuddyState>(
              listener: (context, booksState) {
                // TODO: implement listener
              },
              builder: (context, booksState) {
                if (booksState is BookBuddyError) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8.0,
                      ),
                      child: Center(child: Text(booksState.message)),
                    ),
                  );
                }
                if (booksState is BookBuddyDataLoaded) {
                  if (booksState.booksEntity.items.isEmpty) {
                    return EmptyBooksView(
                      message: '"Nothing found. Please try again."',
                    );
                  }
                  return BooksBodyView(
                    booksEntity: booksState.booksEntity,
                    booksParams: booksState.booksParams,
                    scrollPosition: booksState.currentScrollPosition,
                    onRefresh: () async {
                      await _refreshData(booksParams: booksState.booksParams);
                    },
                  );
                }
                return BooksLoadingView();
              },
            ),
          ],
        ),
      ),
    );
  }
}
