import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model.dart';


const Color creamwhite = Color.fromARGB(255, 236, 236, 236);

final theme1 = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.black26,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: Colors.transparent, width: 1)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: Colors.transparent, width: 1)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        borderSide: BorderSide(color: Colors.transparent, width: 1),
      ),
    ),
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light()
        .copyWith(primary: Colors.black, secondary: Colors.black));

const textStyle1 = TextStyle(
    fontWeight: FontWeight.w500, fontSize: 17, color: Color(0xffffffff));
const List icons = [
  Icons.add_business_sharp,
  Icons.camera_rear,
  Icons.adb_rounded,
  Icons.bar_chart_sharp,
  Icons.handshake_sharp,
  Icons.kebab_dining,
  Icons.lan_rounded,
];
const List colors = [
  Color(0xfffba13f),
  Color(0xfff7c693),
  Color(0xff9b59fd),
  Color(0xffac8bd8),
  Color(0xfffc62ae),
  Color(0xffc885bc),
  Color(0xff5a65dc),
  Color(0xff938acd),
  Color(0xfffb0705),
  Color(0xffe14d4d)
];
final List<Color> columnColors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Color(0xfffc62ae),
  Color(0xfffba13f),
  Colors.teal,
  Colors.pink,
  Color(0xff9b59fd),
  Colors.indigo,
  Colors.brown,
  Colors.lightBlue,
];

Color color = Color(0xff009ca2);

const margin = EdgeInsets.fromLTRB(10, 10, 10, 10);


ThemeData getThemeData(BuildContext context) {
  return ThemeData(
    textTheme: const TextTheme(

        bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white)),
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.deepOrange,
    backgroundColor: Colors.deepOrange,
    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white, size: 40),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            systemNavigationBarDividerColor: Colors.red),
        backgroundColor: Colors.black54,
        elevation: 0,
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20)),
    // used by Theme.of(context).textTheme.bodyText1
    // appBarTheme: const AppBarTheme(
    //     iconTheme: IconThemeData(color: Colors.black87, size: 40),
    //     systemOverlayStyle: SystemUiOverlayStyle(
    //         statusBarColor: Colors.black,
    //         systemNavigationBarColor: Colors.black,
    //         systemNavigationBarDividerColor: Colors.red),
    //     backgroundColor: Colors.white70,
    //     elevation: 0,
    //     titleTextStyle: TextStyle(
    //         color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),

  );
}
