import 'package:flutter/material.dart';

class FormItem extends StatelessWidget {
  const FormItem({
    Key? key,
    required this.titleText,
    this.autofocus = false,
    this.obscureText = false,
    this.enableSuggestions = false,
    required this.validator,
    required this.labelText,
    required this.controllerPassword,
  }) : super(key: key);

  final String titleText, labelText;
  final bool autofocus;
  final bool obscureText, enableSuggestions;
  final TextEditingController controllerPassword;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(titleText),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
          child: TextFormField(
            obscureText: obscureText ? true : false,
            enableSuggestions: enableSuggestions ? true : false,
            autofocus: autofocus ? true : false,
            controller: controllerPassword,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              labelText: labelText,
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
