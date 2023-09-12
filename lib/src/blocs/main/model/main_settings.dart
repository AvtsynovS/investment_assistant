import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_settings.freezed.dart';

@freezed
class MainSettings with _$MainSettings {
  const factory MainSettings({
    ImageProvider<Object>? avatar,
    @Default(false) bool isDarkMode,
  }) = _MainSettings;
}