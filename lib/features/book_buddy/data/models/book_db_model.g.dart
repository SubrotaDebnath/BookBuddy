// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageLinksAdapter extends TypeAdapter<ImageLinks> {
  @override
  final int typeId = 1;

  @override
  ImageLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageLinks(
      smallThumbnail: fields[0] as String,
      thumbnail: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageLinks obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.smallThumbnail)
      ..writeByte(1)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VolumeInfoAdapter extends TypeAdapter<VolumeInfo> {
  @override
  final int typeId = 2;

  @override
  VolumeInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolumeInfo(
      title: fields[0] as String,
      authors: (fields[1] as List).cast<String>(),
      publishedDate: fields[2] as String,
      description: fields[3] as String,
      pageCount: fields[4] as int,
      printType: fields[5] as String,
      maturityRating: fields[6] as String,
      language: fields[7] as String,
      previewLink: fields[8] as String,
      infoLink: fields[9] as String,
      canonicalVolumeLink: fields[10] as String,
      imageLinks: fields[11] as ImageLinks,
    );
  }

  @override
  void write(BinaryWriter writer, VolumeInfo obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.authors)
      ..writeByte(2)
      ..write(obj.publishedDate)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.pageCount)
      ..writeByte(5)
      ..write(obj.printType)
      ..writeByte(6)
      ..write(obj.maturityRating)
      ..writeByte(7)
      ..write(obj.language)
      ..writeByte(8)
      ..write(obj.previewLink)
      ..writeByte(9)
      ..write(obj.infoLink)
      ..writeByte(10)
      ..write(obj.canonicalVolumeLink)
      ..writeByte(11)
      ..write(obj.imageLinks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BookAdapter extends TypeAdapter<Book> {
  @override
  final int typeId = 0;

  @override
  Book read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Book(
      id: fields[0] as String,
      kind: fields[1] as String,
      etag: fields[2] as String,
      selfLink: fields[3] as String,
      volumeInfo: fields[4] as VolumeInfo,
    );
  }

  @override
  void write(BinaryWriter writer, Book obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.kind)
      ..writeByte(2)
      ..write(obj.etag)
      ..writeByte(3)
      ..write(obj.selfLink)
      ..writeByte(4)
      ..write(obj.volumeInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
