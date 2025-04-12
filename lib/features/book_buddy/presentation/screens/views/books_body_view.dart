import 'package:book_buddy/core/params/books_params.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/books_entity.dart';
import 'package:book_buddy/features/book_buddy/presentation/business_logic/book_buddy_bloc/book_buddy_bloc.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/book_card_view.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/end_progress_indicator_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksBodyView extends StatefulWidget {
  const BooksBodyView({
    super.key,
    required this.booksEntity,
    required this.booksParams,
    required this.scrollPosition,
    required this.onRefresh,
  });

  final BooksEntity booksEntity;
  final BooksParams booksParams;
  final double scrollPosition;
  final Future<void> Function() onRefresh;

  @override
  State<BooksBodyView> createState() => _BooksBodyViewState();
}

class _BooksBodyViewState extends State<BooksBodyView> {
  late ScrollController booksScrollController;
  late bool isEndOfPaginationLimit;
  double scrollPosition = 0;

  @override
  void initState() {
    super.initState();
    isEndOfPaginationLimit = widget.booksEntity.totalItems == 0;

    booksScrollController = ScrollController();
    booksScrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollPosition = widget.scrollPosition;
      booksScrollController.jumpTo(scrollPosition);
    });
  }

  void _onScroll() {
    final maxScroll = booksScrollController.position.maxScrollExtent;
    final currentScroll = booksScrollController.offset;

    if (currentScroll == maxScroll && !isEndOfPaginationLimit) {
      final newStartIndex = widget.booksParams.startIndex + 1;
      final newBooksParams = widget.booksParams.copyWith(
        startIndex: newStartIndex,
      );
      context.read<BookBuddyBloc>().add(
        BookBuddyEventFetchBooks(
          booksParams: newBooksParams,
          previousBooksEntity: widget.booksEntity,
          currentScrollPosition: currentScroll,
        ),
      );
    }
  }

  @override
  void dispose() {
    booksScrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    return Expanded(
      child: RefreshIndicator(
        onRefresh: widget.onRefresh,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12),
          physics: AlwaysScrollableScrollPhysics(),
          controller: booksScrollController,
          itemCount: widget.booksEntity.items.length + 1,
          itemBuilder: (context, index) {
            if (widget.booksEntity.items.length == index) {
              return EndListProgressIndicatorView(
                isEndOfPaginationLimit: isEndOfPaginationLimit,
              );
            }
            return BookCardView(bookEntity: widget.booksEntity.items[index]);
          },
        ),
      ),
    );
  }
}
