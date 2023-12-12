import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:investment_assistant/src/helpers/get_login.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
  });

  void _login(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _registration(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/registration');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 139.0, 24.0, 67.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.welcomeTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 44.0, vertical: 10.0),
                      child: Text(
                        AppLocalizations.of(context)!.welcomeBody,
                        textAlign: TextAlign.center,
                        style: const TextStyle(),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 28.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _login(context);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48.0),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.login,
                        ),
                      ),
                    ),
                    FutureBuilder(
                        future: SecureLogin().getSecureLogin(),
                        builder: (context, snapshot) {
                          return SizedBox(
                            child: snapshot.data == null
                                ? OutlinedButton(
                                    onPressed: () {
                                      _registration(context);
                                    },
                                    style: OutlinedButton.styleFrom(
                                      minimumSize:
                                          const Size(double.infinity, 40.0),
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .createAccount,
                                    ),
                                  )
                                : const SizedBox(),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
