import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
ThemeData darkthemeData = ThemeData(
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 18
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        elevation: 20,
        backgroundColor: Color(0xf3337339)),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Color(0xf3337339),
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(),
        backgroundColor: Color(0xf3337339),
        elevation: 0.0,
        titleTextStyle: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white)));



ThemeData light_themeData = ThemeData(
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 18
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        elevation: 20,
        backgroundColor: Color(0xf3337339)),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.black)));
