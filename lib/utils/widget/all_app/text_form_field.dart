import 'package:flutter/material.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/icon_button.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final validate;
 bool autoFocus = false ;
  bool obscure = false;
  IconData? prefixIcon;
  IconData? suffixIcon;
  String? hint;
  String? label;
  double? borderRadius = 18.0;
  Color? textInputColor;
  int? maxLine;
  Color? enableBorderColor;
  Color? suffixColor;

  Color? prefixColor;
  bool? read ;
  Function? onPressed;

  DefaultFormField(
      {super.key,
      required this.controller,
      required this.type,
      required this.validate,
      this.obscure = false,
      this.hint,
        this.autoFocus = false ,
        this.read = false ,
      this.label,
      this.borderRadius = 16,
      this.textInputColor,
      this.maxLine = 1,
      this.prefixIcon,
      this.enableBorderColor = Colors.black,
      this.suffixIcon,
      this.suffixColor = AllColors.appColor,
      this.prefixColor = AllColors.appColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: TextFormField(
        autofocus:autoFocus ,
        readOnly: read!,
        controller: controller,
        keyboardType: type,
        obscureText: obscure,
        maxLines: maxLine,
        validator: validate,
        style: TextStyle(
          color: textInputColor,
        ),
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: IconButton(
            onPressed: () {
              onPressed!();
            },
            icon: Icon(suffixIcon),
          ),
          labelText: label,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color: AllColors.appColor),
          ),
          prefixIconColor: prefixColor,
          suffixIconColor: suffixColor,
        ),
      ),
    );
  }
}
