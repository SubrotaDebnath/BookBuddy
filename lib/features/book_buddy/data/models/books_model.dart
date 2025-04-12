import 'package:book_buddy/features/book_buddy/data/models/book_model.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/books_entity.dart';

class BooksModel extends BooksEntity {
  final List<BookModel> books;

  const BooksModel({
    required super.kind,
    required super.totalItems,
    required this.books,
  }) : super(items: books);

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
    kind: json["kind"] ?? '',
    totalItems: json["totalItems"] ?? 0,
    books:
        json["items"] == null
            ? []
            : List<BookModel>.from(
              json["items"].map((x) => BookModel.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "totalItems": totalItems,
    "items": List<dynamic>.from(books.map((x) => x.toJson())),
  };
}
