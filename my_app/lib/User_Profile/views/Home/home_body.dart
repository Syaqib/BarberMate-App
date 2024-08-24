import 'package:flutter/material.dart';
import 'package:my_app/User_Profile/views/Home/home.dart';
import '../UserProfile/user_profile.dart';

class HomeBody extends MyHomePage {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome To BarberMate',
            ),
            const Icon(Icons.weekend_outlined),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: const Text("Go to Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
