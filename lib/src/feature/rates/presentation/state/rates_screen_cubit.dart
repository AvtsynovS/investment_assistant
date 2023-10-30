import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investment_assistant/src/helpers/SecureStorag/storage_keys.dart';

import '../../domain/models/rate_model.dart';

part 'rates_screen_state.dart';
part 'rates_screen_cubit.freezed.dart';

class RatesCubit extends Cubit<RatesCubitState> {
  RatesCubit() : super(RatesCubitState(rates: []));

  RatesCubitState initState() {
    emit(state);
    return state;
  }

  String ratesBoxTitle = 'rates';
  List<Rate> rates = [];
  Rate? currentRate;
  List<int>? keys = [];

  getSecureKey() async {
    const secureStorage = FlutterSecureStorage();
    final key = await secureStorage.read(key: StorageKeys.boxKey);
    final encryptionKeyUint8List = base64Url.decode(key!);

    return encryptionKeyUint8List;
  }

  initRates() async {
    final encryptionKeyUint8List = await getSecureKey();
    var box = await Hive.openBox<Rate>(ratesBoxTitle,
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    keys = [];
    keys = box.keys.cast<int>().toList();
    rates = [];

    for (final key in keys!) {
      rates.add(box.get(key)!);
    }

    emit(state.copyWith(rates: rates));
  }

  Rate? getCurrentRate() {
    Rate? currentRate;
    for (var rate in rates) {
      if (rate.isActive) {
        currentRate = rate;
      }
    }
    return currentRate;
  }

  void addRate(Rate rate) async {
    final encryptionKeyUint8List = await getSecureKey();
    Box<Rate> allRates = await Hive.openBox<Rate>(ratesBoxTitle,
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    final Map<dynamic, Rate> ratesMap = allRates.toMap();
    dynamic activeKey;
    dynamic changeRate;

    if (allRates.isEmpty || rate.isActive == false) {
      allRates.put(rate.id, rate).then((value) => initRates());
    } else {
      ratesMap.forEach((key, value) {
        if (value.isActive == true) {
          value.isActive = false;
          changeRate = value;
          activeKey = key;
        } else {
          changeRate = value;
          activeKey = key;
        }
      });
      allRates.put(activeKey, changeRate);
      allRates.put(rate.id, rate).then((value) => initRates());
    }
  }

  void updateRate(Rate rate) async {
    List<Rate> allRates = List.from(state.rates);
    final encryptionKeyUint8List = await getSecureKey();
    if (rate.isActive) {
      for (final element in allRates) {
        if (element.isActive) {
          element.isActive = false;
        }
      }
    }

    final index = allRates.indexWhere((element) => element.id == rate.id);
    allRates[index] = rate;

    await Hive.openBox<Rate>(ratesBoxTitle,
            encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
        .then((value) {
      final Map<dynamic, Rate> ratesMap = value.toMap();

      for (final element in allRates) {
        ratesMap.update(element.id, (value) => element);
      }
      return value.putAll(ratesMap);
    }).then(
      (value) => initRates(),
    );

    emit(state.copyWith(rates: allRates));
  }

  void deleteRate(int id) async {
    final encryptionKeyUint8List = await getSecureKey();

    await Hive.openBox<Rate>(ratesBoxTitle,
            encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
        .then((value) {
      final Map<dynamic, Rate> ratesMap = value.toMap();
      dynamic activeKey;
      ratesMap.forEach((key, value) {
        if (value.id == id) {
          activeKey = key;
        }
      });
      return value.delete(activeKey);
    }).then(
      (value) => initRates(),
    );

    final List<Rate> newState =
        state.rates.where((element) => element.id != id).toList();
    emit(state.copyWith(rates: newState));
  }

  void searchRates(String query) async {
    List<Rate> ratesList = [];
    final encryptionKeyUint8List = await getSecureKey();

    await Hive.openBox<Rate>(ratesBoxTitle,
            encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
        .then((rates) {
      rates.toMap().forEach((key, value) => ratesList.add(value));
    });

    final suggestions = ratesList.where((rate) {
      final rateTitle = rate.rateTitle.toLowerCase();
      final input = query.toLowerCase();

      return rateTitle.contains(input);
    }).toList();

    emit(state.copyWith(rates: suggestions));
  }

  void changeRate(int id) async {
    List<Rate> allRates = [];
    final encryptionKeyUint8List = await getSecureKey();

    await Hive.openBox<Rate>(ratesBoxTitle,
            encryptionCipher: HiveAesCipher(encryptionKeyUint8List))
        .then((value) {
      final Map<dynamic, Rate> ratesMap = value.toMap();
      ratesMap.forEach((key, value) {
        if (value.id == id) {
          value.isActive = true;
          currentRate = value;
        } else {
          value.isActive = false;
        }
        allRates.add(value);
      });
      return value.putAll(ratesMap);
    }).then(
      (value) => initRates(),
    );

    emit(state.copyWith(rates: allRates));
  }
}
