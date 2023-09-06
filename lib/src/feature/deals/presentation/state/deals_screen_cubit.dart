import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

  void addDeal(Deal deal) {
    emit(state.copyWith(deals: [...state.deals, deal]));
  }

  void updateDeal(Deal deal) {
    List<Deal> allDeals = List.from(state.deals);
    final index = allDeals.indexWhere((element) => element.id == deal.id);
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
