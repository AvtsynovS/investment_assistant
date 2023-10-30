import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_settings.freezed.dart';

@freezed
class MainSettings with _$MainSettings {
  const factory MainSettings({
    @Default(AssetImage('assets/images/defaultPerson.jpg'))
    ImageProvider<Object>? avatar,
    @Default(false) bool isDarkMode,
    Locale? locale,
  }) = _MainSettings;
}
