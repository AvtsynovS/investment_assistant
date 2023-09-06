import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyFormField extends StatelessWidget {
  const MyFormField({
    Key? key,
    required this.fieldTitle,
    required this.myController,
    required this.validation,
    this.typeField,
    this.autofocus,
    this.hintText,
  }) : super(key: key);

  final TextEditingController myController;
  final String? Function(String?) validation;
  final String fieldTitle;
  final TextInputType? typeField;
  final String? hintText;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    if (typeField == TextInputType.number) {
      return TextFormField(
        controller: myController,
        autofocus: autofocus ?? false,
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
        ),
        validator: validation,
      );
    }

    return TextFormField(
      controller: myController,
      keyboardType: typeField,
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        labelText: fieldTitle,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
      validator: validation,
    );
  }
}
