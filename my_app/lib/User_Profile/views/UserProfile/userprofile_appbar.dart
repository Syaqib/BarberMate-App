import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import 'package:my_app/User_Profile/views/EditProfile/edit_profile.dart';
import 'package:my_app/User_Profile/View_Model/userprofile_viewmodel.dart';

class UserProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserProfileAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<UserProfileViewModel>(
      builder: (context, viewmodel) => AppBar(
        title: const Text('User Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(
                    userProfile: viewmodel.userProfile,
                    updateProfile: viewmodel.updateProfile,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
