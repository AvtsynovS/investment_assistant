import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyFormField extends StatelessWidget {
  const MyFormField({
    Key? key,
    required this.fieldTitle,
    this.myController,
    this.validation,
    this.typeField,
    this.autofocus,
    this.hintText,
    this.enabled,
    this.filled,
  }) : super(key: key);

  final TextEditingController? myController;
  final String? Function(String?)? validation;
  final String fieldTitle;
  final TextInputType? typeField;
  final String? hintText;
  final bool? autofocus;
  final bool? enabled;
  final bool? filled;

  @override
  Widget build(BuildContext context) {
    if (typeField == TextInputType.number) {
      return TextFormField(
        controller: myController,
        autofocus: autofocus ?? false,
        enabled: enabled ?? true,
        keyboardType: typeField,
        inputFormatters: fieldTitle == AppLocalizations.of(context)!.quantity ||
                fieldTitle == AppLocalizations.of(context)!.monthlyCommission
            ? [
                NumberTextInputFormatter(
                  integerDigits: 10,
                  decimalDigits: 0,
                  maxValue: '1000000000',
                  allowNegative: false,
                  overrideDecimalPoint: true,
                  insertDecimalDigits: true,
                ),
              ]
            : [
                NumberTextInputFormatter(
                  integerDigits: 10,
                  decimalDigits: 8,
                  maxValue: '1000000000.00',
                  allowNegative: false,
                  overrideDecimalPoint: true,
                  insertDecimalDigits: false,
                ),
              ],
        decoration: InputDecoration(
          labelText: fieldTitle,
          hintText: hintText,
          border: const OutlineInputBorder(),
          filled: filled ?? false,
        ),
        validator: validation,
      );
    }

    return TextFormField(
      controller: myController,
      enabled: enabled ?? true,
      keyboardType: typeField,
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        labelText: fieldTitle,
        hintText: hintText,
        border: const OutlineInputBorder(),
        filled: filled ?? false,
      ),
      validator: validation,
    );
  }
}
