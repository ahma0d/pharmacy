import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  final String text;
  Color colorText;
  TextOverflow textOverflow ;
  double sizeText;
  double heightText ;
  double letterSpacing ;
  FontWeight fontWeight;
  int maxLine;

   NormalText({
    super.key,
    required this.text,
    this.colorText = Colors.black ,
     this.textOverflow = TextOverflow.ellipsis,
    this.sizeText = 16.0 ,
     this.heightText = 0.0,
     this.letterSpacing = 0.0,
    this.fontWeight = FontWeight.w400 ,
     this.maxLine = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
     overflow:  textOverflow ,
      maxLines: maxLine ,
      style: TextStyle(
       height: heightText,
        letterSpacing: letterSpacing,
        color: colorText,
        fontSize: sizeText,
        fontWeight: fontWeight,
      ),
    );
  }
}
