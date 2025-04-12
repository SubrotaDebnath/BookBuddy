import 'package:hive/hive.dart';

part 'book_db_model.g.dart';

@HiveType(typeId: 1)
class ImageLinks {
  @HiveField(0)
  final String smallThumbnail;

  @HiveField(1)
  final String thumbnail;

  ImageLinks({required this.smallThumbnail, required this.thumbnail});
}

@HiveType(typeId: 2)
class VolumeInfo {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final List<String> authors;

  @HiveField(2)
  final String publishedDate;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final int pageCount;

  @HiveField(5)
  final String printType;

  @HiveField(6)
  final String maturityRating;

  @HiveField(7)
  final String language;

  @HiveField(8)
  final String previewLink;

  @HiveField(9)
  final String infoLink;

  @HiveField(10)
  final String canonicalVolumeLink;

  @HiveField(11)
  final ImageLinks imageLinks;

  VolumeInfo({
    required this.title,
    required this.authors,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    required this.printType,
    required this.maturityRating,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
    required this.imageLinks,
  });
}

@HiveType(typeId: 0)
class Book {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String kind;

  @HiveField(2)
  final String etag;

  @HiveField(3)
  final String selfLink;

  @HiveField(4)
  final VolumeInfo volumeInfo;

  Book({
    required this.id,
    required this.kind,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
  });
}
