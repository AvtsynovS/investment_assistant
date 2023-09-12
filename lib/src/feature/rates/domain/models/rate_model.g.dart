// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RateAdapter extends TypeAdapter<Rate> {
  @override
  final int typeId = 2;

  @override
  Rate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rate(
      id: fields[0] as int,
      rateTitle: fields[1] as String,
      transactionCommission: fields[2] as double,
      isActive: fields[5] as bool,
      isMonthlyCommission: fields[3] as bool?,
      monthlyCommission: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Rate obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.rateTitle)
      ..writeByte(2)
      ..write(obj.transactionCommission)
      ..writeByte(3)
      ..write(obj.isMonthlyCommission)
      ..writeByte(4)
      ..write(obj.monthlyCommission)
      ..writeByte(5)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
