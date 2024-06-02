import 'package:flutter/material.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

class AfterCart extends StatelessWidget {
  final String textRight;

  final String textLeft;
  Color rightText;

  Color leftText;

   AfterCart({
    super.key,
    required this.textRight,
    required this.textLeft,
    this.rightText = Colors.grey ,
    this.leftText = Colors.grey ,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          NormalText(
            text: textLeft,
            colorText:leftText,
          ),
          Spacer(),
          NormalText(
            text: textRight,
            colorText: rightText,
          )
        ],
      ),
    );
  }
}
