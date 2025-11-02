// app_route.dart
import 'package:flutter/material.dart';
import 'package:news/core/routes/app_routes_name.dart';
import 'package:news/module/card/pages/card_screen.dart';
import 'package:news/module/home/pages/home_screen.dart';
import 'package:news/module/home/widget/card_details.dart';
import 'package:news/module/splash/pages/splash_screen.dart';
import 'package:news/module/home/widget/card_list.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
    AppRoutesName.splash: (_) => const SplashScreen(),
    AppRoutesName.home: (_) => const HomeScreen(),
    AppRoutesName.card: (_) => const CardScreen(),

  };
}
