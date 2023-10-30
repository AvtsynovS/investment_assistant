import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExitModal extends StatefulWidget {
  const ExitModal({
    super.key,
  });
  @override
  State<ExitModal> createState() => _ExitModalState();
}

class _ExitModalState extends State<ExitModal> {
  void _exitApp() {
    (Platform.isAndroid) ? SystemNavigator.pop() : () => exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(AppLocalizations.of(context)!.exitModalMessage),
      actions: <Widget>[
        TextButton(
          onPressed: () =>
              Navigator.pop(context, AppLocalizations.of(context)!.no),
          child: Text(AppLocalizations.of(context)!.no),
        ),
        TextButton(
          onPressed: () {
            Hive.close();
            _exitApp();
          },
          child: Text(AppLocalizations.of(context)!.yes),
        ),
      ],
    );
  }
}
