import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_assistant/src/feature/settings/presentation/state/main_cubit.dart';
import 'package:investment_assistant/src/ui/widgets/form_item.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeLogin extends StatefulWidget {
  const ChangeLogin({super.key});

  @override
  State<ChangeLogin> createState() => _ChangeLoginState();
}

class _ChangeLoginState extends State<ChangeLogin> {
  final _formKey = GlobalKey<FormState>();
  final controllerOldLogin = TextEditingController();
  final controllerNewLogin = TextEditingController();
  String? _currentError;
  String _currentLogin = "", _newLogin = "";

  _changeOldLogin() {
    setState(() => _currentLogin = controllerOldLogin.text);
  }

  _changeNewLogin() {
    setState(() => _newLogin = controllerNewLogin.text);
  }

  checkValidation() {
    Navigator.pop(context, AppLocalizations.of(context)!.edit);
  }

  String? currentLoginValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.requiredFieldError;
    }
    if (_currentError != null) {
      return _currentError;
    }
    return null;
  }

  String? sameLoginValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.requiredFieldError;
    }
    if (_newLogin == _currentLogin) {
      return AppLocalizations.of(context)!.changeSameLoginError;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    controllerOldLogin.text = _currentLogin;
    controllerNewLogin.text = _newLogin;
    controllerOldLogin.addListener(_changeOldLogin);
    controllerNewLogin.addListener(_changeNewLogin);
  }

  @override
  void dispose() {
    controllerOldLogin.dispose();
    controllerNewLogin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String currentLogin = _currentLogin;
    String newLogin = _newLogin;
    return BlocBuilder<MainCubit, MainCubitState>(
      builder: (context, state) {
        final settingsCubit = context.read<MainCubit>();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AlertDialog(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.changeLoginPageTitle,
                    textAlign: TextAlign.center,
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                  ),
                ],
              ),
            ),
            titlePadding: const EdgeInsets.only(top: 10.0),
            content: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FormItem(
                      titleText:
                          AppLocalizations.of(context)!.oldLoginFieldTitle,
                      autofocus: true,
                      labelText: AppLocalizations.of(context)!
                          .oldLoginFieldPlaceholder,
                      controllerPassword: controllerOldLogin,
                      validator: currentLoginValidator,
                    ),
                    FormItem(
                      titleText:
                          AppLocalizations.of(context)!.newLoginFieldTitle,
                      obscureText: true,
                      enableSuggestions: true,
                      labelText: AppLocalizations.of(context)!
                          .newLoginFieldPlaceholder,
                      controllerPassword: controllerNewLogin,
                      validator: sameLoginValidator,
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(
                        context, AppLocalizations.of(context)!.cancel),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55.0, vertical: 12.0),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.cancel,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final bool checkCurrentLogin = await settingsCubit
                          .checkCurrentLogin(currentLogin);
                      checkCurrentLogin
                          ? setState(() => _currentError = null)
                          : setState(() => _currentError =
                              AppLocalizations.of(context)!
                                  .changeCurrentLoginError);

                      if (_formKey.currentState!.validate()) {
                        settingsCubit.changeLogin(newLogin);
                        checkValidation();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55.0, vertical: 12.0),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.ok,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
