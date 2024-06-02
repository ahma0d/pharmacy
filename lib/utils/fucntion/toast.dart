import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String message,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 18.0,
      gravity: ToastGravity.BOTTOM,
    );

// ignore: constant_identifier_names
enum ToastState { Success, Warning, Error }

Color chooseToastColor(ToastState state) {
  late Color color;
  switch (state) {
    case ToastState.Success:
      color = Colors.green;
      break;
    case ToastState.Warning:
      color = Colors.amber;
      break;
    case ToastState.Error:
      color = Colors.red;
      break;
  }
  return color;
}

void messageSnackBar(
        {required context, required String text, required ToastState state}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: chooseToastColor(state),
      ),
    );
