import 'package:flutter/material.dart';
import 'package:investment_assistant/src/localizations/l10n/all_locales.dart';
import 'package:provider/provider.dart';

import '../../localizations/locale_provider.dart';

class LanguageMenu extends StatelessWidget {
  const LanguageMenu(
      {required this.languageCode, required this.setCurrentLocale, super.key});

  final String? languageCode;
  final void Function(Locale value) setCurrentLocale;

  @override
  Widget build(BuildContext context) {
    final currentLocale = AllLocale.all.firstWhere((locale) => locale.languageCode == languageCode);
    return DropdownButton<Locale>(
      alignment: Alignment.centerRight,
      icon: const Visibility(visible: false, child: Icon(Icons.arrow_downward)),
      value: currentLocale,
      elevation: 16,
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.primary,
      ),
      onChanged: (Locale? value) {
        setCurrentLocale(value!);
        Provider.of<LocaleProvider>(context, listen: false).setLocale(value);
      },
      items: AllLocale.all.map<DropdownMenuItem<Locale>>((Locale value) {
        return DropdownMenuItem<Locale>(
          value: value,
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(value.countryCode!),
          ),
        );
      }).toList(),
    );
  }
}
