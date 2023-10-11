import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';

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

  String dealsBoxTitle = 'deals';
  List<Deal> allDeals = [];
  List<int>? keys = [];

  initDeals() async {
    var box = await Hive.openBox<Deal>(dealsBoxTitle);
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
    await Hive.openBox<Deal>(dealsBoxTitle)
        .then((deals) => deals.put(deal.id, deal))
        .then((value) => initDeals());
  }

  void updateDeal(Deal deal) async {
    await Hive.openBox<Deal>(dealsBoxTitle).then((value) {
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

  void updateDealBySell(Deal deal) async {
    List<Deal> allDeals = List.from(state.deals);
    final index = allDeals.indexWhere((element) => element.id == deal.id);

    if (deal.sell != null) {
      await Hive.openBox<Deal>(dealsBoxTitle).then((value) {
        final Map<dynamic, Deal> dealsMap = value.toMap();
        dynamic activeKey;
        dealsMap.forEach((key, value) {
          if (value.id == deal.id) {
            activeKey = key;
          }
        });
        return value.delete(activeKey);
      }).then(
        (value) => initDeals(),
      );
    } else {
      await Hive.openBox<Deal>(dealsBoxTitle).then((value) {
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
  }

  void restoreDeal(Deal deal) async {
    if (deal.sell == null) {
      addDeal(deal);
    }
  }

  void deleteDeal(int id) async {
    await Hive.openBox<Deal>(dealsBoxTitle).then((value) {
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

  void searchDeals(String query) async {
    List<Deal> dealsList = [];
    await Hive.openBox<Deal>(dealsBoxTitle).then((deals) {
      deals.toMap().forEach((key, value) => dealsList.add(value));
    });

    final suggestions = dealsList.where((deal) {
      final dealTitle = deal.assetsTitle.toLowerCase();
      final input = query.toLowerCase();

      return dealTitle.contains(input);
    }).toList();

    if (query.isEmpty) {
      emit(state.copyWith(deals: dealsList));
    } else {
      emit(state.copyWith(deals: suggestions));
    }
  }

    void filterForDateRange(List<String> dateRange) async {
    List<Deal> filterCloseDeals = [];
    await Hive.openBox<Deal>(dealsBoxTitle).then((closeDeals) {
      closeDeals.toMap().forEach((key, value) {
        if (dateRange.contains(value.createAt)) {
          filterCloseDeals.add(value);
        }
      });
    });
    emit(state.copyWith(deals: filterCloseDeals));
  }
}
