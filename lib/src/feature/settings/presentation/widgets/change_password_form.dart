import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_assistant/src/feature/settings/presentation/state/main_cubit.dart';
import 'package:investment_assistant/src/ui/widgets/form_item.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final controllerOldPassword = TextEditingController();
  final controllerNewPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();
  String? _currentError;
  String _currentPassword = "", _newPassword = "", _confirmPassword = "";

  _changeOldPassword() {
    setState(() => _currentPassword = controllerOldPassword.text);
  }

  _changeNewPassword() {
    setState(() => _newPassword = controllerNewPassword.text);
  }

  _changeConfirmPassword() {
    setState(() => _confirmPassword = controllerConfirmPassword.text);
  }

  checkValidation() {
    Navigator.pop(context, AppLocalizations.of(context)!.edit);
  }

  String? currentPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.requiredFieldError;
    }
    if (_currentError != null) {
      return _currentError;
    }
    return null;
  }

  String? samePasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.requiredFieldError;
    }
    if (_newPassword == _currentPassword) {
      return AppLocalizations.of(context)!.changeSamePasswordError;
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.requiredFieldError;
    }
    if (_newPassword != _confirmPassword) {
      return AppLocalizations.of(context)!.changeConfirmPasswordError;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    controllerOldPassword.text = _currentPassword;
    controllerNewPassword.text = _newPassword;
    controllerConfirmPassword.text = _confirmPassword;
    controllerOldPassword.addListener(_changeOldPassword);
    controllerNewPassword.addListener(_changeNewPassword);
    controllerConfirmPassword.addListener(_changeConfirmPassword);
  }

  @override
  void dispose() {
    controllerOldPassword.dispose();
    controllerNewPassword.dispose();
    controllerConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String currentPassword = _currentPassword;
    String newPassword = _newPassword;
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
                    AppLocalizations.of(context)!.changePasswordPageTitle,
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
                          AppLocalizations.of(context)!.oldPasswordFieldTitle,
                      autofocus: true,
                      labelText: AppLocalizations.of(context)!.oldPasswordFieldPlaceholder,
                      controllerPassword: controllerOldPassword,
                      validator: currentPasswordValidator,
                    ),
                    FormItem(
                      titleText: AppLocalizations.of(context)!.newPasswordFieldTitle,
                      obscureText: true,
                      enableSuggestions: true,
                      labelText:  AppLocalizations.of(context)!.newPasswordFieldPlaceholder,
                      controllerPassword: controllerNewPassword,
                      validator: samePasswordValidator,
                    ),
                    FormItem(
                      titleText: AppLocalizations.of(context)!.confirmPasswordFieldTitle,
                      obscureText: true,
                      enableSuggestions: true,
                      labelText: AppLocalizations.of(context)!.confirmPasswordFieldPlaceholder,
                      controllerPassword: controllerConfirmPassword,
                      validator: confirmPasswordValidator,
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
                      final bool checkCurrentPassword = await settingsCubit
                          .checkCurrentPassword(currentPassword);
                      checkCurrentPassword
                          ? setState(() => _currentError = null)
                          : setState(() => _currentError =
                              AppLocalizations.of(context)!
                                  .changeCurrentPasswordError);

                      if (_formKey.currentState!.validate()) {
                        settingsCubit.changePassword(newPassword);
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
