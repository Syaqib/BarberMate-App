import 'package:flutter/material.dart';
import 'package:my_app/configs/routes.dart';
import 'package:my_app/configs/service_locator.dart';

void main() {
  initializeServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarberMate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.home, // Directly start with the HomePage
      debugShowCheckedModeBanner: false,
    );
  }
}
