import 'package:freezed_annotation/freezed_annotation.dart';

part 'deal.freezed.dart';

@freezed
class Deal with _$Deal {
  const factory Deal({
  required int id,
  required String assetsTitle,
  required String assetsType,
  required double buy,
  required int quantity,
  String? createAt,
  String? closeAt,
  double? additinalProfit,
  double? sell,
  double? profit,
  String? profitPersent,
  @Default(true) bool status,
  }) = _Deal;
}
