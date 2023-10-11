import 'package:intl/intl.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';
import 'package:investment_assistant/src/feature/rates/domain/models/rate_model.dart';

Deal getProfit(Deal deal, Rate activeRate) {
  double rusTax(double prof) {
    return prof / 100 * 13;
  }

  if (deal.sell != null) {
    final double brokerComissionForSell =
        deal.sell! / 100 * activeRate.transactionCommission;
    final double brokerComissionForBuy =
        deal.buy / 100 * activeRate.transactionCommission;
    final double income =
        deal.sell! - deal.buy - brokerComissionForBuy - brokerComissionForSell;
    final double yieldWithoutTax = income > 0 ? income - rusTax(income) : 0;

    final double additinalProfitWithoutTax =
        deal.additinalProfit ?? 0 - rusTax(deal.additinalProfit ?? 0);

    final double profit = income < 0 ? income : yieldWithoutTax;
    final double yieldProfitPersent = income < 0
        ? ((additinalProfitWithoutTax + deal.sell!) /
                    (deal.buy +
                        brokerComissionForBuy +
                        brokerComissionForSell) -
                1) *
            100
        : ((additinalProfitWithoutTax + deal.sell!) /
                    (deal.buy +
                        brokerComissionForBuy +
                        brokerComissionForSell +
                        rusTax(income)) -
                1) *
            100;

    deal.status = false;
    deal.profit = additinalProfitWithoutTax + profit * deal.quantity;
    deal.profitPersent = yieldProfitPersent;
    deal.closeAt = DateFormat('dd.MM.yyyy').format(DateTime.now());

    return deal;
  } else {
    return deal;
  }
}
