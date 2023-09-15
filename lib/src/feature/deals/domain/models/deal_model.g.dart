// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DealAdapter extends TypeAdapter<Deal> {
  @override
  final int typeId = 1;

  @override
  Deal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Deal(
      id: fields[0] as int,
      assetsTitle: fields[1] as String,
      assetsType: fields[2] as String,
      buy: fields[3] as double,
      quantity: fields[4] as int,
      createAt: fields[5] as String?,
      closeAt: fields[6] as String?,
      additinalProfit: fields[7] as double?,
      sell: fields[8] as double?,
      profit: fields[9] as double?,
      profitPersent: fields[10] as double?,
      status: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Deal obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.assetsTitle)
      ..writeByte(2)
      ..write(obj.assetsType)
      ..writeByte(3)
      ..write(obj.buy)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.createAt)
      ..writeByte(6)
      ..write(obj.closeAt)
      ..writeByte(7)
      ..write(obj.additinalProfit)
      ..writeByte(8)
      ..write(obj.sell)
      ..writeByte(9)
      ..write(obj.profit)
      ..writeByte(10)
      ..write(obj.profitPersent)
      ..writeByte(11)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
