import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

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
          content: const Text('Вы точно хотите выйти?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Нет'),
              child: const Text('Нет'),
            ),
            TextButton(
              onPressed: () => _exitApp(),
              child: const Text('Да'),
            ),
          ],
        );
  }
}
