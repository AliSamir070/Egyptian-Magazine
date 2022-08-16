import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStyle{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.deepOrange,
    secondaryHeaderColor: Colors.black,
    canvasColor: Colors.white,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
      titleSmall: TextStyle(
          color: Colors.grey,
          fontSize: 16,
      ),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
      ),
      iconTheme: IconThemeData(
        color:Colors.black
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.deepOrange,

    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.deepOrange,
    secondaryHeaderColor: Colors.white,
    canvasColor: Colors.black,
    textTheme: TextTheme(
      titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
      titleSmall: TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
    ),
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light
        ),
        iconTheme: IconThemeData(
            color:Colors.white
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.deepOrange,

    ),
  );
}