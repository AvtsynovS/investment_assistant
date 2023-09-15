import 'package:hive/hive.dart';

part 'deal_model.g.dart';

enum AssetsType {
  stocks,
  bonds,
}

@HiveType(typeId: 1)
class Deal {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String assetsTitle;
  @HiveField(2)
  final String assetsType;
  @HiveField(3)
  final double buy;
  @HiveField(4)
  final int quantity;
  @HiveField(5)
  final String? createAt;
  @HiveField(6)
  String? closeAt;
  @HiveField(7)
  final double? additinalProfit;
  @HiveField(8)
  double? sell;
  @HiveField(9)
  double? profit;
  @HiveField(10)
  double? profitPersent;
  @HiveField(11)
  bool status;

  Deal({
    required this.id,
    required this.assetsTitle,
    required this.assetsType,
    required this.buy,
    required this.quantity,
    this.createAt,
    this.closeAt,
    this.additinalProfit,
    this.sell,
    this.profit,
    this.profitPersent,
    this.status = true,
  });
}
