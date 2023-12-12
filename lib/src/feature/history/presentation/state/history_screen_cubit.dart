import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';
import 'package:investment_assistant/src/helpers/SecureStorag/storage_keys.dart';

part 'history_screen_state.dart';
part 'history_screen_cubit.freezed.dart';

class HistoryCubit extends Cubit<HistoryCubitState> {
  HistoryCubit() : super(HistoryCubitState(closeDeals: []));

  getSecureKey() async {
    const secureStorage = FlutterSecureStorage();
    final key = await secureStorage.read(key: StorageKeys.boxKey);
    final encryptionKeyUint8List = base64Url.decode(key!);

    return encryptionKeyUint8List;
  }

  HistoryCubitState initState() {
    emit(state);
    return state;
  }

  String historyBoxTitle = 'history';
  List<Deal> allCloseDeals = [];
  List<int>? keys = [];

  initHistory() async {
    final encryptionKeyUint8List = await getSecureKey();
    var box = await Hive.openBox<Deal>(historyBoxTitle,
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    keys = [];
    keys = box.keys.cast<int>().toList();
    allCloseDeals = [];

    if (box.isNotEmpty) {
      for (final key in keys!) {
        allCloseDeals.add(box.get(key)!);
      }
    }

    emit(state.copyWith(closeDeals: allCloseDeals));
  }

    setDefaultHistoryDeals() async {
        final encryptionKeyUint8List = await getSecureKey();
    final historyDealsBox = await Hive.openBox<Deal>(historyBoxTitle,
            encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    historyDealsBox.deleteAll(['history']);

    emit(state.copyWith(closeDeals: []));
  }

  void updateHistory(Deal deal) async {
    final encryptionKeyUint8List = await getSecureKey();
    if (deal.sell != null) {
      await Hive.openBox<Deal>(historyBoxTitle,
              encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
          .then((closeDeals) => closeDeals.put(deal.id, deal))
          .then((value) => initHistory());
    }
  }

  void restoreCloseDeal(Deal deal) async {
    final encryptionKeyUint8List = await getSecureKey();
    if (deal.sell == null) {
      await Hive.openBox<Deal>(historyBoxTitle,
              encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
          .then((closeDeals) {
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

  void searchCloseDeals(String query) async {
    List<Deal> closeDealsList = [];
    final encryptionKeyUint8List = await getSecureKey();
    await Hive.openBox<Deal>(historyBoxTitle,
            encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
        .then((closeDeals) {
      closeDeals.toMap().forEach((key, value) => closeDealsList.add(value));
    });

    final suggestions = closeDealsList.where((deal) {
      final closeDealTitle = deal.assetsTitle.toLowerCase();
      final input = query.toLowerCase();

      return closeDealTitle.contains(input);
    }).toList();

    emit(state.copyWith(closeDeals: suggestions));
  }

  void filterForDateRange(List<String> dateRange) async {
    List<Deal> filterCloseDeals = [];
    final encryptionKeyUint8List = await getSecureKey();
    await Hive.openBox<Deal>(historyBoxTitle,
            encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
        .then((closeDeals) {
      closeDeals.toMap().forEach((key, value) {
        if (dateRange.contains(value.closeAt)) {
          filterCloseDeals.add(value);
        }
      });
    });
    emit(state.copyWith(closeDeals: filterCloseDeals));
  }
}
