import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;

  Color colorInput;
  Color hintColor ;
  bool focus;
   final onChange ;
  String hint;
   DefaultTextField({
    super.key,
    required this.controller,
    required this.type,
    required this.onChange,
    this.focus = true,
    this.hint = "",
    this.colorInput = Colors.white,
    this.hintColor = Colors.white ,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: colorInput,
      ),
      onChanged: onChange,
      keyboardType: TextInputType.text,
      autofocus: true,
      controller: controller,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: hintColor,
        ),
        hintText: hint,
      ),
    );
  }
}
