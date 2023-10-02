// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 1;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      UserId: fields[0] as Object,
      PostimageUrl: fields[1] as String,
      PostText: fields[2] as String,
      postDate: fields[3] as String,
      PostLike: (fields[4] as List).cast<dynamic>(),
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.UserId)
      ..writeByte(1)
      ..write(obj.PostimageUrl)
      ..writeByte(2)
      ..write(obj.PostText)
      ..writeByte(3)
      ..write(obj.postDate)
      ..writeByte(4)
      ..write(obj.PostLike)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
