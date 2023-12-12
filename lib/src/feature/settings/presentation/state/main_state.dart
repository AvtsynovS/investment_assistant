part of 'main_cubit.dart';

@freezed
class MainCubitState with _$MainCubitState {
  const factory MainCubitState({
    final ImageProvider<Object>? avatar,
    @Default(false) bool isDarkMode,
    String? locale,
  }) = _MainCubitState;
}
