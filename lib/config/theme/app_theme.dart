import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Color primaryColor = const Color.fromARGB(255, 252, 39, 39);
// Color secondaryColor = const Color.fromARGB(255, 255, 236, 27);

// List<Color> colors = [
//   primaryColor,
//   secondaryColor

// ];

class AppTheme {
  AppTheme();
  
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    // primaryColor: primaryColor,
    brightness: Brightness.dark,
    // colorSchemeSeed: colors[0],
  
    // appBarTheme: const AppBarTheme(
    //   // backgroundColor: Colors.black87,
    //   iconTheme: IconThemeData(color: Colors.white70),
    //   color: Colors.black12,
    //   titleTextStyle: TextStyle(
    //     color: Colors.white70, 
    //     fontSize: 26
    //   )
    // ),
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(),
    //   bodyMedium: TextStyle(),
    // ).apply(
    //   bodyColor: Colors.white70, 
    //   displayColor: Colors.blue, 
    // ),

    // cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
    //   brightness: Brightness.dark,
    //   barBackgroundColor: Colors.amber
    // )

  );

 
}