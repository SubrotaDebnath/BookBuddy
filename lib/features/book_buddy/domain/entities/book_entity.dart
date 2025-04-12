import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String kind;
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfoEntity volumeInfoEntity;

  const BookEntity({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfoEntity,
  });


  @override
  List<Object?> get props => [
    kind,
    id,
    etag,
    selfLink,
    volumeInfoEntity,
  ];
}

class VolumeInfoEntity extends Equatable {
  final String title;
  final List<String> authors;
  final String publishedDate;
  final String description;
  final int pageCount;
  final String printType;
  final String maturityRating;
  final ImageLinksEntity imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;

  const VolumeInfoEntity({
    required this.title,
    required this.authors,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    required this.printType,
    required this.maturityRating,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  @override
  List<Object?> get props => [
    title,
    publishedDate,
    description,
    pageCount,
    printType,
    maturityRating,
    imageLinks,
    language,
    previewLink,
    infoLink,
    canonicalVolumeLink,
  ];
}

class ImageLinksEntity extends Equatable {
  final String smallThumbnail;
  final String thumbnail;

  const ImageLinksEntity({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];
}
