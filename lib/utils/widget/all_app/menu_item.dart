import 'package:flutter/material.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';

import 'text_normal.dart';

// ignore: must_be_immutable
class MenuItem extends StatelessWidget {
  final String type;
  final IconData icon;
  final String value;
  Color typeColor;

   MenuItem({
    super.key,
    required this.type,
    required this.value,
    required this.icon,
    this.typeColor = AllColors.appColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Icon(icon , color: AllColors.appColor,),
            const SizedBox(
              width: 30.0,
            ),
            NormalText(text: type, sizeText: 18.0,colorText: typeColor,fontWeight: FontWeight.bold),
            const SizedBox(
              width: 35.0,
            ),
            NormalText(text: value, textOverflow: TextOverflow.clip,),
          ],
        ),
      ),
    );
  }
}
