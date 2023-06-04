import 'package:flutter/material.dart';

class Decoradores {
  static InputDecoration decoradorLoginTexFormField({
    required String labelText,
    required String hintText,
  }) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        // suffixIcon: Icon(Icons.check),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        hintText: hintText);
  }
}
