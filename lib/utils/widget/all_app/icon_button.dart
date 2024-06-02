import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultIconButton extends StatelessWidget {
  final IconData iconData;

  final Function onPressed;
   Color iconColor;
  DefaultIconButton({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData , color: iconColor, ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
