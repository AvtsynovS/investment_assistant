import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

  void _exitApp() {
    (Platform.isAndroid) ? SystemNavigator.pop() : () => exit(0);
  }

// ВОЗМОЖНО ЭТОТ ФАЙЛ НЕНУЖЕН. НАДО ПОДУМАТЬ.
class SettingsData {
  SettingsData({
    required this.title,
    required this.leadingIcon,
    this.trailingImage,
    // this.action,
  });

  final String title;
  final Widget leadingIcon;
  final Widget? trailingImage;
  // final Function action;
}

final List<SettingsData> settingsData = [
  SettingsData(
    title: 'Профиль',
    leadingIcon: const Icon(Icons.person),
    // action: () {
    //   navigation: '/profile',
    // }
    // navigation: '/profile',
  ),
  SettingsData(
    title: 'Сменить язык',
    leadingIcon: const Icon(Icons.language),
    trailingImage: const Icon(Icons.language),
  ),
  SettingsData(
    title: 'Сменить тему',
    leadingIcon: const Icon(Icons.brush),
    trailingImage: const Icon(Icons.brush),
  ),
  SettingsData(
    title: 'Выйти',
    leadingIcon: const Icon(Icons.circle),
    trailingImage: IconButton(
      icon: const Icon(Icons.exit_to_app),
      onPressed: () => _exitApp(),
    ),
  ),
];
