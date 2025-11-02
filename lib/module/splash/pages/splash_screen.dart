import 'package:flutter/material.dart';
import 'package:news/core/routes/app_routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  Future.delayed(const Duration(seconds: 5),(){
    Navigator.pushNamed(context, AppRoutesName.home);
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:Image.asset("assets/image/mic_splash.png"),
          )

        ],
      ),
    );
  }
}
