import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/models/rate_model.dart';

part 'rates_screen_state.dart';
part 'rates_screen_cubit.freezed.dart';

class RatesCubit extends Cubit<RatesCubitState> {
  RatesCubit() : super(RatesCubitState(rates: []));

  RatesCubitState initState() {
    emit(state);
    return state;
  }

  List<Rate> rates = [];
  List<int>? keys = [];

  initRates() async {
    var box = await Hive.openBox<Rate>('rates');
    keys = [];
    keys = box.keys.cast<int>().toList();
    rates = [];

    if (box.isNotEmpty) {
      for (final key in keys!) {
        rates.add(box.get(key)!);
      }
    }

    box.close();
    emit(state.copyWith(rates: rates));
  }

  void addRate(Rate rate) async {
    Box<Rate> allRates = await Hive.openBox<Rate>('rates');
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
        }
      });
      allRates.put(activeKey, changeRate);
      allRates.put(rate.id, rate).then((value) => initRates());
    }
  }

  void updateRate(Rate rate) async {
    List<Rate> allRates = List.from(state.rates);
    if (rate.isActive) {
      for (final element in allRates) {
        if (element.isActive) {
          element.isActive = false;
        }
      }
    }

    final index = allRates.indexWhere((element) => element.id == rate.id);
    allRates[index] = rate;

    await Hive.openBox<Rate>('rates').then((value) {
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
    await Hive.openBox<Rate>('rates').then((value) {
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
}
