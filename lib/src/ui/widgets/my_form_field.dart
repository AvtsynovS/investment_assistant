import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        inputFormatters: fieldTitle == 'Quantity'
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ]
            : [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                LengthLimitingTextInputFormatter(8),
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
