import 'package:flutter/material.dart';
import 'package:my_app/User_Profile/View_Model/userprofile_viewmodel.dart';
import 'package:my_app/User_Profile/models/user_details.dart';
import 'package:provider/provider.dart';

class UserProfileBody extends StatelessWidget {
  const UserProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userProfileViewModel = Provider.of<UserProfileViewModel>(context);
    UserProfile userProfile = userProfileViewModel.userProfile;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage(userProfile.profilePicture),
        ),
        const SizedBox(height: 20),
        Text(
          'Name: ${userProfile.name}',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          'Barber/Customer: ${userProfile.role}',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          'Location: ${userProfile.location}',
          style: Theme.of(context).textTheme.headline6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < userProfile.starRating; i++)
              Icon(Icons.star, color: Colors.yellow),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          'Phone Number: ${userProfile.phoneNumber}',
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
