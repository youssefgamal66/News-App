import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    primaryColor: AppColor.white,
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black,size: 30),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 30),
      centerTitle: true,
    ),
  );

  static ThemeData dark = ThemeData(
    primaryColor: AppColor.black,
    scaffoldBackgroundColor: AppColor.black,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white,size: 30),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
      centerTitle: true,
    ),
  );
}
