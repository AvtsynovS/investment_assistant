import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';
import 'package:investment_assistant/src/feature/rates/domain/models/rate_model.dart';

part 'deals_screen_state.dart';
part 'deals_screen_cubit.freezed.dart';

class DealsCubit extends Cubit<DealsCubitState> {
  // ### Задаем начальное состояние стейта ###
  DealsCubit() : super(DealsCubitState(deals: []));
  // ### Или принимаем начальное состояние из вне ###
  // DealsCubit(deals) : super(deals);

  DealsCubitState initState() {
    emit(state);
    return state;
  }

  void addDeal(Deal deal) {
    emit(state.copyWith(deals: [...state.deals, deal]));
  }

  void updateDeal(Deal deal) {
    List<Deal> allDeals = List.from(state.deals);
    final index = allDeals.indexWhere((element) => element.id == deal.id);

    allDeals[index] = deal;

    emit(state.copyWith(deals: allDeals));
  }

  void updateDealBySell(Deal deal, Rate activeRate) {
    List<Deal> allDeals = List.from(state.deals);
    final index = allDeals.indexWhere((element) => element.id == deal.id);

    double rusTax(double prof) {
      return prof / 100 * 13;
    }

    if (deal.sell != null) {
      final double brokerComissionForSell =
          deal.sell! / 100 * activeRate.transactionCommission;
      final double brokerComissionForBuy =
          deal.buy / 100 * activeRate.transactionCommission;
      final double yield = deal.sell! -
          deal.buy -
          brokerComissionForBuy -
          brokerComissionForSell;
      final double yieldWithoutTax = yield > 0 ? yield - rusTax(yield) : 0;

      final double additinalProfitWithoutTax =
          deal.additinalProfit ?? 0 - rusTax(deal.additinalProfit ?? 0);

      final double profit = yield < 0 ? yield : yieldWithoutTax;
      final double yieldProfitPersent = yield < 0
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
                          rusTax(yield)) -
                  1) *
              100;

      deal.status = false;
      deal.profit = additinalProfitWithoutTax + profit * deal.quantity;
      deal.profitPersent = yieldProfitPersent;
    }

    allDeals[index] = deal;

    emit(state.copyWith(deals: allDeals));
  }

  void updateDealStatus(int id, bool status) {
    List<Deal> allDeals = List.from(state.deals);
    final index = allDeals.indexWhere((element) => element.id == id);
    allDeals[index].status = true;

    emit(state.copyWith(deals: allDeals));
  }

  void deleteDeal(int id) {
    final List<Deal> newState =
        state.deals.where((element) => element.id != id).toList();
    emit(state.copyWith(deals: newState));
  }
}
