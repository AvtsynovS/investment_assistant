class Rate {
  final int id;
  final String rateTitle;
  final double transactionCommission;
  final bool? isMonthlyCommission;
  final int? monthlyCommission;
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
