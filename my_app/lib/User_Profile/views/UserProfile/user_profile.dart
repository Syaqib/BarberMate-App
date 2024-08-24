import 'package:flutter/material.dart';
import 'userprofile_appbar.dart';
import 'userprofile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: UserProfileAppBar(),
      body: UserProfileBody(),
    );
  }
}
