import 'package:flutter/material.dart';

import 'package:investment_assistant/src/localizations/l10n/all_locales.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = AllLocale.all[0];

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!AllLocale.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }
}
