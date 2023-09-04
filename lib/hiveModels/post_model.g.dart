// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class postmodelAdapter extends TypeAdapter<post_model> {
  @override
  final int typeId = 1;

  @override
  post_model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return post_model(
      UserId: fields[0] as String?,
      PostimageUrl: fields[1] as String?,
      PostText: fields[2] as String?,
      postDate: fields[3] as String?,
      PostLike: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, post_model obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.UserId)
      ..writeByte(1)
      ..write(obj.PostimageUrl)
      ..writeByte(2)
      ..write(obj.PostText)
      ..writeByte(3)
      ..write(obj.postDate)
      ..writeByte(4)
      ..write(obj.PostLike);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is postmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
