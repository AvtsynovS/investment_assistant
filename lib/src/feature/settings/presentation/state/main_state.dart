part of 'main_cubit.dart';

// https://www.youtube.com/watch?v=J5W5ebOKTxY
@freezed
class MainCubitState with _$MainCubitState {
  const factory MainCubitState({
    final ImageProvider<Object>? avatar,
    @Default(false) bool isDarkMode,
    Locale? locale,
  }) = _MainCubitState;
}
