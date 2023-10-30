// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

part 'main_settings_model.g.dart';

@HiveType(typeId: 3)
class MainSettings {
  @HiveField(0)
  final ImageProvider<Object>? avatar;
  @HiveField(1)
  bool isDarkMode;
  @HiveField(2)
  Locale? locale;

  MainSettings({
    required this.isDarkMode,
    this.avatar,
    this.locale,
  });
}
