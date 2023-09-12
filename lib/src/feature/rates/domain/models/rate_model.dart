import 'package:hive/hive.dart';

part 'rate_model.g.dart';

  @HiveType(typeId: 2)
class Rate {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String rateTitle;
  @HiveField(2)
  final double transactionCommission;
  @HiveField(3)
  final bool? isMonthlyCommission;
  @HiveField(4)
  final int? monthlyCommission;
  @HiveField(5)
  bool isActive;


  Rate({
    required this.id,
    required this.rateTitle,
    required this.transactionCommission,
    required this.isActive,
    this.isMonthlyCommission,
    this.monthlyCommission,
  });
}
