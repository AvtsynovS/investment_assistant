enum AssetsType {
  stocks,
  bonds,
}

class Deal {
  final int id;
  final String assetsTitle;
  final String assetsType;
  final double buy;
  final int quantity;
  final String? createAt;
  final String? finishDate;
  final double? additinalProfit;
  double? sell;
  double? profit;
  double? profitPersent;
  bool status;

  Deal({
    required this.id,
    required this.assetsTitle,
    required this.assetsType,
    required this.buy,
    required this.quantity,
    this.status = true,
    this.createAt,
    this.finishDate,
    this.profit,
    this.profitPersent,
    this.additinalProfit,
    this.sell,
  });
}
