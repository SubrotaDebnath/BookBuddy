import 'package:book_buddy/features/book_buddy/data/models/book_db_model.dart';
import 'package:book_buddy/features/book_buddy/domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  final VolumeInfoModel volumeInfoModel;

  const BookModel({
    required super.kind,
    required super.id,
    required super.etag,
    required super.selfLink,
    required this.volumeInfoModel,
  }) : super(volumeInfoEntity: volumeInfoModel);

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    kind: json["kind"] ?? '',
    id: json["id"] ?? '',
    etag: json["etag"] ?? '',
    selfLink: json["selfLink"] ?? '',
    volumeInfoModel:
        json["volumeInfo"] == null
            ? VolumeInfoModel.fromJson({})
            : VolumeInfoModel.fromJson(json["volumeInfo"]),

  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "id": id,
    "etag": etag,
    "selfLink": selfLink,
    "volumeInfo": volumeInfoModel.toJson(),

  };

  BookModel copyWithModel({
    String? kind,
    String? id,
    String? etag,
    String? selfLink,
    VolumeInfoModel? volumeInfoModel,
  }) =>
      BookModel(
        kind: kind ?? this.kind,
        id: id ?? this.id,
        etag: etag ?? this.etag,
        selfLink: selfLink ?? this.selfLink,
        volumeInfoModel: volumeInfoModel ?? this.volumeInfoModel,
      );

  factory BookModel.fromHive(Book hiveBook) {
    return BookModel(
      id: hiveBook.id,
      kind: hiveBook.kind,
      etag: hiveBook.etag,
      selfLink: hiveBook.selfLink,
      volumeInfoModel: VolumeInfoModel.fromHive(hiveBook.volumeInfo),
    );
  }

  Book toHive() {
    return Book(
      id: id,
      kind: kind,
      etag: etag,
      selfLink: selfLink,
      volumeInfo: volumeInfoModel.toHive(),
    );
  }
}

class VolumeInfoModel extends VolumeInfoEntity {
  final ImageLinksModel imageLinksModel;

  const VolumeInfoModel({
    required super.title,
    required super.authors,
    required super.publishedDate,
    required super.description,
    required super.pageCount,
    required super.printType,
    required super.maturityRating,
    required this.imageLinksModel,
    required super.language,
    required super.previewLink,
    required super.infoLink,
    required super.canonicalVolumeLink,
  }) : super(imageLinks: imageLinksModel);

  factory VolumeInfoModel.fromJson(Map<String, dynamic> json) =>
      VolumeInfoModel(
        title: json["title"] ?? '',
        authors: json["authors"]==null?[]:List<String>.from(json["authors"].map((x) => x)),
        publishedDate: json["publishedDate"] ?? '',
        description: json["description"] ?? '',
        pageCount: json["pageCount"] ?? 0,
        printType: json["printType"] ?? '',
        maturityRating: json["maturityRating"] ?? '',
        imageLinksModel:
            json["imageLinks"] == null
                ? ImageLinksModel.fromJson({})
                : ImageLinksModel.fromJson(json["imageLinks"]),
        language: json["language"]??'',
        previewLink: json["previewLink"]??'',
        infoLink: json["infoLink"]??'',
        canonicalVolumeLink: json["canonicalVolumeLink"]??'',
      );

  Map<String, dynamic> toJson() => {
    "title": title,
    "publishedDate": publishedDate,
    "description": description,
    "pageCount": pageCount,
    "printType": printType,
    "maturityRating": maturityRating,
    "imageLinks": imageLinksModel.toJson(),
    "language": language,
    "previewLink": previewLink,
    "infoLink": infoLink,
    "canonicalVolumeLink": canonicalVolumeLink,
  };

  factory VolumeInfoModel.fromHive(VolumeInfo hiveVolumeInfo) {
    return VolumeInfoModel(
      title: hiveVolumeInfo.title,
      authors: List<String>.from(hiveVolumeInfo.authors),
      publishedDate: hiveVolumeInfo.publishedDate,
      description: hiveVolumeInfo.description,
      pageCount: hiveVolumeInfo.pageCount,
      printType: hiveVolumeInfo.printType,
      maturityRating: hiveVolumeInfo.maturityRating,
      language: hiveVolumeInfo.language,
      previewLink: hiveVolumeInfo.previewLink,
      infoLink: hiveVolumeInfo.infoLink,
      canonicalVolumeLink: hiveVolumeInfo.canonicalVolumeLink,
      imageLinksModel: ImageLinksModel.fromHive(hiveVolumeInfo.imageLinks),
    );
  }

  VolumeInfo toHive() {
    return VolumeInfo(
      title: title,
      authors: authors,
      publishedDate: publishedDate,
      description: description,
      pageCount: pageCount,
      printType: printType,
      maturityRating: maturityRating,
      language: language,
      previewLink: previewLink,
      infoLink: infoLink,
      canonicalVolumeLink: canonicalVolumeLink,
      imageLinks: imageLinksModel.toHive(),
    );
  }
}

class ImageLinksModel extends ImageLinksEntity {
  const ImageLinksModel({
    required super.smallThumbnail,
    required super.thumbnail,
  });

  factory ImageLinksModel.fromJson(Map<String, dynamic> json) =>
      ImageLinksModel(
        smallThumbnail: json["smallThumbnail"]??'',
        thumbnail: json["thumbnail"]??'',
      );

  Map<String, dynamic> toJson() => {
    "smallThumbnail": smallThumbnail,
    "thumbnail": thumbnail,
  };

  factory ImageLinksModel.fromHive(ImageLinks hiveImageLinks) {
    return ImageLinksModel(
      smallThumbnail: hiveImageLinks.smallThumbnail,
      thumbnail: hiveImageLinks.thumbnail,
    );
  }

  ImageLinks toHive() {
    return ImageLinks(
      smallThumbnail: smallThumbnail,
      thumbnail: thumbnail,
    );
  }
}
