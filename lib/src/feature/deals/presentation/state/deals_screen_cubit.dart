import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

  List<Deal> allDeals = [];
  List<int>? keys = [];

  initDeals() async {
    var box = await Hive.openBox<Deal>('deals');
    keys = [];
    keys = box.keys.cast<int>().toList();
    allDeals = [];

    if (box.isNotEmpty) {
      for (final key in keys!) {
        allDeals.add(box.get(key)!);
      }
    }

    box.close();
    emit(state.copyWith(deals: allDeals));
  }

  void addDeal(Deal deal) async {
    await Hive.openBox<Deal>('deals')
        .then((deals) => deals.put(deal.id, deal))
        .then((value) => initDeals());
  }

  void updateDeal(Deal deal) async {
    await Hive.openBox<Deal>('deals').then((value) {
      final Map<dynamic, Deal> dealsMap = value.toMap();
      dynamic activeKey;
      dealsMap.forEach((key, value) {
        if (value.id == deal.id) {
          activeKey = key;
        }
      });
      return value.put(activeKey, deal);
    }).then(
      (value) => initDeals(),
    );

    List<Deal> allDeals = List.from(state.deals);
    final index = allDeals.indexWhere((element) => element.id == deal.id);

    allDeals[index] = deal;

    emit(state.copyWith(deals: allDeals));
  }

  void updateDealBySell(Deal deal, Rate activeRate) async {
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
      final double income = deal.sell! -
          deal.buy -
          brokerComissionForBuy -
          brokerComissionForSell;
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
    }

    await Hive.openBox<Deal>('deals').then((value) {
      final Map<dynamic, Deal> dealsMap = value.toMap();
      dynamic activeKey;
      dealsMap.forEach((key, value) {
        if (value.id == deal.id) {
          activeKey = key;
        }
      });
      return value.put(activeKey, deal);
    }).then(
      (value) => initDeals(),
    );

    allDeals[index] = deal;

    emit(state.copyWith(deals: allDeals));
  }

  void deleteDeal(int id) async {
    await Hive.openBox<Deal>('deals').then((value) {
      final Map<dynamic, Deal> dealsMap = value.toMap();
      dynamic activeKey;
      dealsMap.forEach((key, value) {
        if (value.id == id) {
          activeKey = key;
        }
      });
      return value.delete(activeKey);
    }).then(
      (value) => initDeals(),
    );

    final List<Deal> newState =
        state.deals.where((element) => element.id != id).toList();
    emit(state.copyWith(deals: newState));
  }
}
