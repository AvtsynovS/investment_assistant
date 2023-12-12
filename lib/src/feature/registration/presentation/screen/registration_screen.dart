import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:investment_assistant/src/helpers/SecureStorag/secure_storag_model.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final controllerName = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _isName = '';
  String _isPassword = '';
  String _isConfirmPassword = '';
  bool _isValid = true;

  _changeName() {
    setState(() => _isName = controllerName.text);
    _checkValidation();
  }

  _changePassword() {
    setState(() => _isPassword = controllerPassword.text);
    _checkValidation();
  }

  _changeConfirmPassword() {
    setState(() => _isConfirmPassword = controllerConfirmPassword.text);
    _checkValidation();
  }

  void _checkValidation() {
    if (controllerName.text != '' &&
        controllerPassword.text != '' &&
        controllerConfirmPassword.text != '' &&
        controllerPassword.text == controllerConfirmPassword.text) {
      setState(() {
        _isValid = false;
      });
    }
  }

  void _addUser(String login, String password) {
    SecureStoragModel().setLogin(login);
    SecureStoragModel().setPassword(password);
  }

  @override
  void initState() {
    super.initState();
    controllerName.text = _isName;
    controllerPassword.text = _isPassword;
    controllerConfirmPassword.text = _isConfirmPassword;
    controllerName.addListener(_changeName);
    controllerPassword.addListener(_changePassword);
    controllerConfirmPassword.addListener(_changeConfirmPassword);
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerPassword.dispose();
    controllerConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isValid = _isValid;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 63.0, 24.0, 5.0),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 53.0),
                  child: Text(
                    AppLocalizations.of(context)!.registration,
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
                  padding: const EdgeInsets.only(top: 8.0, bottom: 25.0),
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
                Text(
                  AppLocalizations.of(context)!.confirmPasswordFieldLabel,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 69.0),
                  child: TextFormField(
                    controller: controllerConfirmPassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!
                          .loginConfirmPasswordPlaceholder,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!
                            .loginPasswordErrorMessage;
                      }
                      if (value != controllerPassword.text) {
                        return AppLocalizations.of(context)!
                            .confirmPasswordErrorMessage;
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: isValid
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              _addUser(_isName, _isPassword);
                              Navigator.pushNamed(context, '/homePage');
                            } else {
                              return;
                            }
                          },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48.0)),
                    child: Text(
                      AppLocalizations.of(context)!.registration,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.registrationMessage,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0.0, 10.0),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.login,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
