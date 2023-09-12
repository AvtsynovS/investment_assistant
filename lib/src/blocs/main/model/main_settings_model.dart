// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class MainSettings {
  final ImageProvider<Object>? avatar;
  bool isDarkMode;

  MainSettings({
    required this.isDarkMode,
    this.avatar,
  });
}
