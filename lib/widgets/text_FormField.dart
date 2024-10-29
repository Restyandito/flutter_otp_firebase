import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscure;
  final TextStyle? labelStyle;

  const TextFieldForm({
    Key? key,
    required this.controller,
    required this.labelText,
    this.isObscure = false,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle ?? TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
