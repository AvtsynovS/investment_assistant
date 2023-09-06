import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/rate_model.dart';

part 'rates_screen_state.dart';
part 'rates_screen_cubit.freezed.dart';

class RatesCubit extends Cubit<RatesCubitState> {
  RatesCubit() : super(RatesCubitState(rates: []));

  RatesCubitState initState() {
    emit(state);
    return state;
  }

  void addRate(Rate rate) {
    List<Rate> allRates = List.from(state.rates);

    if (rate.isActive) {
      for (final element in allRates) {
        if (element.isActive) {
          element.isActive = false;
        }
      }
    }
    emit(state.copyWith(rates: [...allRates, rate]));
  }

  void updateRate(Rate rate) {
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

    emit(state.copyWith(rates: allRates));
  }

  void updateRateStatus(int id, bool isActive) {
    List<Rate> allRates = List.from(state.rates);
    final index = allRates.indexWhere((element) => element.id == id);
    allRates[index].isActive = true;

    emit(state.copyWith(rates: allRates));
  }

  void deleteRate(int id) {
    final List<Rate> newState =
        state.rates.where((element) => element.id != id).toList();
    emit(state.copyWith(rates: newState));
  }
}
