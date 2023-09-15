import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';

part 'history_screen_state.dart';
part 'history_screen_cubit.freezed.dart';

class HistoryCubit extends Cubit<HistoryCubitState> {
  HistoryCubit() : super(HistoryCubitState(closeDeals: []));

  HistoryCubitState initState() {
    emit(state);
    return state;
  }

  String historyBoxTitle = 'history';
  List<Deal> allCloseDeals = [];
  List<int>? keys = [];

  initHistory() async {
    var box = await Hive.openBox<Deal>(historyBoxTitle);
    keys = [];
    keys = box.keys.cast<int>().toList();
    allCloseDeals = [];

    if (box.isNotEmpty) {
      for (final key in keys!) {
        allCloseDeals.add(box.get(key)!);
      }
    }

    box.close();
    emit(state.copyWith(closeDeals: allCloseDeals));
  }

  void updateHistory(Deal deal) async {
    if (deal.sell != null) {
      await Hive.openBox<Deal>(historyBoxTitle)
          .then((closeDeals) => closeDeals.put(deal.id, deal))
          .then((value) => initHistory());
    }
  }

  void restoreCloseDeal(Deal deal) async {
    if (deal.sell == null) {
      await Hive.openBox<Deal>(historyBoxTitle).then((closeDeals) {
        final Map<dynamic, Deal> closeDealsMap = closeDeals.toMap();
        dynamic activeKey;
        closeDealsMap.forEach((key, value) {
          if (value.id == deal.id) {
            activeKey = key;
          }
        });
        return closeDeals.delete(activeKey);
      }).then((value) => initHistory());
    }
  }
}
