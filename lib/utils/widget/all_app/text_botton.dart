import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;

  final Function onPressed;
  Color? color;

  double? size;

  FontWeight? fontWeight;

  DefaultTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = 18.0,
    this.fontWeight = FontWeight.w500,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
