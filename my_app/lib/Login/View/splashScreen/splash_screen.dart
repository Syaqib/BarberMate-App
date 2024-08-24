import 'package:flutter/material.dart';
import '../StartPage/home_page.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key});

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }


    _navigateToNextScreen() async {
    // Simulate a delay (e.g., 4 seconds) before navigating to the next screen.
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F0EF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://image.similarpng.com/very-thumbnail/2021/08/Barbershop-logo-design-template-on-transparent-background-PNG.png',
              height: 150.0, // Adjust the height as needed
              width: 150.0, // Adjust the width as needed
            ),
            const SizedBox(height: 20.0),
            Text(
              'BARBERMATE',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}