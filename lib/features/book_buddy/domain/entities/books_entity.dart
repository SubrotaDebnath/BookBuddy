import 'package:book_buddy/features/book_buddy/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

class BooksEntity extends Equatable {
  final String kind;
  final int totalItems;
  final List<BookEntity> items;

  const BooksEntity({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  BooksEntity copyWith({
    final String? kind,
    final int? totalItems,
    final List<BookEntity>? items,
  }) {
    return BooksEntity(
      kind: kind ?? this.kind,
      totalItems: totalItems ?? this.totalItems,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [kind, totalItems, items];
}
