import 'package:book_buddy/core/utils/formater.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/book_entity.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/book_image_view.dart';
import 'package:book_buddy/features/book_buddy/presentation/screens/views/common_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Details'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BookImageView(
                  imageUrl: bookEntity.volumeInfoEntity.imageLinks.thumbnail,
                ),
                SizedBox(height: 24),
                Text(
                  bookEntity.volumeInfoEntity.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 8),

                Text(
                  Formater().formatAuthorsAsCommaSeparatedText(
                    bookEntity.volumeInfoEntity.authors,
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 24),
                BookDescriptionCard(bookEntity: bookEntity),
                SizedBox(height: 24),
                BookDetailsCard(bookEntity: bookEntity),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookDescriptionCard extends StatelessWidget {
  const BookDescriptionCard({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Card(
      child: Container(
        width: screenSize.width,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              bookEntity.volumeInfoEntity.description.isEmpty
                  ? 'N/A'
                  : bookEntity.volumeInfoEntity.description,
            ),
          ],
        ),
      ),
    );
  }
}

class BookDetailsCard extends StatelessWidget {
  const BookDetailsCard({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Card(
      child: Container(
        width: screenSize.width,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Details",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            BookDetailsRow(
              label: 'Pages:',
              value: bookEntity.volumeInfoEntity.pageCount.toString(),
            ),
            BookDetailsRow(
              label: 'Publish:',
              value: bookEntity.volumeInfoEntity.publishedDate,
            ),
            BookDetailsRow(
              label: 'Language:',
              value: bookEntity.volumeInfoEntity.language,
            ),
          ],
        ),
      ),
    );
  }
}

class BookDetailsRow extends StatelessWidget {
  const BookDetailsRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label)),
        Expanded(child: Text(value.isEmpty || value == '0' ? 'N/A' : value)),
      ],
    );
  }
}
