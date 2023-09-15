part of 'history_screen_cubit.dart';

@freezed
class HistoryCubitState with _$HistoryCubitState {
  factory HistoryCubitState({
    @Default([]) List<Deal> closeDeals
  }) = _HistoryCubitState;
}