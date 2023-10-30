import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:investment_assistant/src/helpers/SecureStorag/secure_storag_model.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final controllerName = TextEditingController();
  final controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _isName = '';
  String _isPassword = '';
  bool _isValid = true;

  _changeName() {
    setState(() => _isName = controllerName.text);
    _checkValidation();
  }

  _changePassword() {
    setState(() => _isPassword = controllerPassword.text);
    _checkValidation();
  }

  void _checkValidation() async {
    final secureLogin = await SecureStoragModel().readLogin();
    final securePassword = await SecureStoragModel().readPassword();

    if (controllerName.text == secureLogin &&
        controllerPassword.text == securePassword) {
      setState(() {
        _isValid = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controllerName.text = _isName;
    controllerPassword.text = _isPassword;
    controllerName.addListener(_changeName);
    controllerPassword.addListener(_changePassword);
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 93.0, 24.0, 15.0),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 53.0),
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.userNameFieldLabel,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 25.0),
                    child: TextFormField(
                      controller: controllerName,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: AppLocalizations.of(context)!
                            .loginUserNamePlaceholder,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!
                              .loginUserNameErrorMessage;
                        }
                        return null;
                      },
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.passwordFieldLabel,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 69.0),
                    child: TextFormField(
                      controller: controllerPassword,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: AppLocalizations.of(context)!
                            .loginPasswordPlaceholder,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!
                              .loginPasswordErrorMessage;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 70.0),
                    child: ElevatedButton(
                      onPressed: _isValid
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamed(context, '/homePage');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                    AppLocalizations.of(context)!
                                        .loginMessageError,
                                  )),
                                );
                              }
                            },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48.0)),
                      child: Text(
                        AppLocalizations.of(context)!.login,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.loginMessage,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/registration');
                        },
                        child: Text(
                          AppLocalizations.of(context)!.registration,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
