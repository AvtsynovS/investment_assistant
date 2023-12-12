// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainSettingsAdapter extends TypeAdapter<MainSettings> {
  @override
  final int typeId = 3;

  @override
  MainSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainSettings(
      isDarkMode: fields[1] as bool,
      avatar: fields[0] as String?,
      locale: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MainSettings obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.avatar)
      ..writeByte(1)
      ..write(obj.isDarkMode)
      ..writeByte(2)
      ..write(obj.locale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
