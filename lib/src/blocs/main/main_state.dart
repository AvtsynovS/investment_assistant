part of 'main_cubit.dart';

// https://www.youtube.com/watch?v=J5W5ebOKTxY
@freezed
class MainCubitState with _$MainCubitState {
  const factory MainCubitState({
    required bool isSwitched,
    final ImageProvider<Object>? avatar,
  }) = _MainCubitState;
}
