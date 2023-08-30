enum AssetsType {
  stocks,
  bonds,
}
// Возможно, чтобы менять статус на лету надо будет убрать final
class Deal {
  final int id;
  final String assetsTitle;
  final String assetsType;
  final double buy;
  final int quantity;
  final String? createAt;
  final String? finishDate;
  final double? sell;
  final double? proffit;
  final String? proffitPersent;
  // TODO исправить, статус будет устанавливаться через cubit
  final bool status;

  const Deal({
    required this.id,
    required this.assetsTitle,
    required this.assetsType,
    required this.buy,
    required this.quantity,
    required this.status,
    this.createAt,
    this.finishDate,
    this.proffit,
    this.proffitPersent,
    this.sell,
  });
}