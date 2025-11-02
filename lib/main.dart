import 'package:flutter/material.dart';
import 'package:news/core/routes/app_routes_name.dart';
import 'package:news/core/routes/route.dart';
import 'package:news/core/theme/app_theme.dart';
import 'package:news/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<NewsViewModel>(create: (context) => NewsViewModel())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute.routes,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
    );
  }
}
