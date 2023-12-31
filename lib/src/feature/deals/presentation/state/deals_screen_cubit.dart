import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';
import 'package:investment_assistant/src/helpers/SecureStorag/storage_keys.dart';

part 'deals_screen_state.dart';
part 'deals_screen_cubit.freezed.dart';

class DealsCubit extends Cubit<DealsCubitState> {
  DealsCubit() : super(DealsCubitState(deals: []));

  DealsCubitState initState() {
    emit(state);
    return state;
  }

  String dealsBoxTitle = 'deals';
  List<Deal> allDeals = [];
  List<int>? keys = [];

  getSecureKey() async {
    const secureStorage = FlutterSecureStorage();
    final key = await secureStorage.read(key: StorageKeys.boxKey);
    final encryptionKeyUint8List = base64Url.decode(key!);

    return encryptionKeyUint8List;
  }

  initDeals() async {
    final encryptionKeyUint8List = await getSecureKey();
    var box = await Hive.openBox<Deal>(dealsBoxTitle,
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    keys = [];
    keys = box.keys.cast<int>().toList();
    allDeals = [];

    if (box.isNotEmpty) {
      for (final key in keys!) {
        allDeals.add(box.get(key)!);
      }
    }

    emit(state.copyWith(deals: allDeals));
  }

  setDefaultDeals() async {
        final encryptionKeyUint8List = await getSecureKey();
    final dealsBox = await Hive.openBox<Deal>(dealsBoxTitle,
            encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    dealsBox.deleteAll(['deals']);

    emit(state.copyWith(deals: []));
  }

  void addDeal(Deal deal) async {
    final encryptionKeyUint8List = await getSecureKey();
    await Hive.openBox<Deal>(dealsBoxTitle,
            encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
        .then((deals) => deals.put(deal.id, deal))
        .then((value) => initDeals());
  }

  void updateDeal(Deal deal) async {
    final encryptionKeyUint8List = await getSecureKey();
    await Hive.openBox<Deal>(dealsBoxTitle,
            encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
        .then((value) {
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
    final encryptionKeyUint8List = await getSecureKey();

    if (deal.sell != null) {
      await Hive.openBox<Deal>(dealsBoxTitle,
              encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
          .then((value) {
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
      await Hive.openBox<Deal>(dealsBoxTitle,
              encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
          .then((value) {
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
    final encryptionKeyUint8List = await getSecureKey();
    await Hive.openBox<Deal>(dealsBoxTitle,
            encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
        .then((value) {
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
    final encryptionKeyUint8List = await getSecureKey();
    List<Deal> dealsList = [];
    await Hive.openBox<Deal>(dealsBoxTitle,
            encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
        .then((deals) {
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
    final encryptionKeyUint8List = await getSecureKey();
    List<Deal> filterCloseDeals = [];
    await Hive.openBox<Deal>(dealsBoxTitle,
            encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
        .then((closeDeals) {
      closeDeals.toMap().forEach((key, value) {
        if (dateRange.contains(value.createAt)) {
          filterCloseDeals.add(value);
        }
      });
    });
    emit(state.copyWith(deals: filterCloseDeals));
  }
}
