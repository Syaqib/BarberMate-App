import 'package:flutter/material.dart';
import 'package:my_app/Login/View/splashScreen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySplashScreen(),
    );
  }
}
