import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateTo({
  required context,
  required Widget screen,
}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen,
    ),

  );
}

void navigateAndFinish({
  required context,
  required Widget screen,
}) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => screen),
    (route) => false,
  );
}

void navigateBack({required context}) {
  Navigator.of(context).pop();
}
