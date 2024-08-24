import 'package:flutter/material.dart';
import '../../../../User_Profile/views/UserProfile/user_profile.dart'; // Import the ProfilePage file

class CustBookingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustBookingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('BarberMate'),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
          icon: const Icon(Icons.person),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
