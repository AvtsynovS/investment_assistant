import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate.freezed.dart';

@freezed
class Rate with _$Rate {
  const factory Rate({
    required int id,
    required String rateTitle,
    required double transactionCommission,
    @Default(false) bool isMonthlyCommission,
    @Default(false) bool isActive,
    @Default(0) int monthlyCommission,
  }) = _Rate;
}