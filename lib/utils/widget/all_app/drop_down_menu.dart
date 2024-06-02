import 'package:flutter/material.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';

import 'text_normal.dart';

// ignore: must_be_immutable
class DropDownApp extends StatefulWidget {
  final List listDrop;

  // ignore: prefer_typing_uninitialized_variables
  final valueChoose;
  final String hintText;
  double sizeHint;
  double height ;
  Color dropColor ;
  DropDownApp({
    super.key,
    required this.listDrop,
    required this.valueChoose,
    required this.hintText,
    this.sizeHint = 16.0,
    this.dropColor = Colors.transparent ,
    this.height = 40.0,
  });

  @override
  // ignore: no_logic_in_create_state
  State<DropDownApp> createState() =>  _DropDownAppState(
    valueChoose: valueChoose,
    listDrop: listDrop,
    hintText: hintText,
    sizeHint: sizeHint,

  );
}

class _DropDownAppState extends State<DropDownApp> {
  dynamic valueChoose;
  final List listDrop;
  final String hintText;
  double sizeHint;

  _DropDownAppState({
    required this.listDrop,
    required this.hintText,
    required this.valueChoose,
    this.sizeHint = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 10.0 , right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey[300],
      ),
      child: DropdownButton(
        dropdownColor: AllColors.appColor,

        underline: const SizedBox(width: 0.0, height: 0.0,),
        borderRadius: BorderRadius.circular(13.0),
        isDense: true,
        isExpanded: true,
        hint: NormalText(
          text: widget.hintText,
          sizeText: widget.sizeHint,
        ),
        items: widget.listDrop.map((e) {
          return DropdownMenuItem(
            value: e ,
            child: NormalText(
              text: "$e",
              colorText: Colors.black,
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            valueChoose = value;
          });
        },
        value: valueChoose,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
