part of 'deals_screen_cubit.dart';

@freezed
class DealsCubitState with _$DealsCubitState {
  factory DealsCubitState({
    @Default([]) List<Deal> deals
  }) = _DealsCubitState;
}