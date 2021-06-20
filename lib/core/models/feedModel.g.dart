// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedModelAdapter extends TypeAdapter<FeedModel> {
  @override
  final int typeId = 1;

  @override
  FeedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedModel(
      channelName: fields[1] as String,
      highhumb: fields[3] as String,
      id: fields[0] as String,
      subtitle: fields[5] as String,
      isMoreneeded: fields[4] as bool,
      isbookMarked: fields[6] as bool,
      title: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FeedModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.channelName)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.highhumb)
      ..writeByte(4)
      ..write(obj.isMoreneeded)
      ..writeByte(5)
      ..write(obj.subtitle)
      ..writeByte(6)
      ..write(obj.isbookMarked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
