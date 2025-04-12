import 'package:book_buddy/core/utils/formater.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/book_entity.dart';
import 'package:book_buddy/features/book_buddy/presentation/business_logic/favorite_book_bloc/favourite_book_bloc.dart';
import 'package:book_buddy/features/book_buddy/presentation/routing/route_names.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/book_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteBookCardView extends StatelessWidget {
  const FavouriteBookCardView({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNames.kBookDetailsScreen,
          arguments: bookEntity,
        );
      },
      child: Stack(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      BookImageView(
                        imageUrl:
                            bookEntity
                                .volumeInfoEntity
                                .imageLinks
                                .smallThumbnail,
                        height: 100,
                        width: 80,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bookEntity.volumeInfoEntity.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  Formater().formatAuthorsAsCommaSeparatedText(
                                    bookEntity.volumeInfoEntity.authors,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {
                context.read<FavouriteBookBloc>().add(
                  FavouriteBookEventDelete(bookId: bookEntity.id),
                );
              },
              icon: Icon(Icons.favorite, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
