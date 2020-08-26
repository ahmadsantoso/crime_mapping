import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget prefixIcon;

  TextInput({this.controller, this.hintText, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon, 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),         
          borderSide: BorderSide(
            width: 2,
          ),
        ),
      ),
    );
  }
}