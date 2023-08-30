import 'package:flutter/material.dart';

abstract class AllLocale {
  allLocales();

  static final all = [
    const Locale("ru", "Русский"),
    const Locale("en", "English"),
  ];
}