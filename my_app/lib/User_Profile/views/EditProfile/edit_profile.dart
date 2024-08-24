import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../View_Model/userprofile_viewmodel.dart';
import '../../models/user_details.dart';

class EditProfilePage extends StatefulWidget {
  final UserProfile userProfile;
  final Function(UserProfile) updateProfile;

  const EditProfilePage({
    required this.userProfile,
    required this.updateProfile,
    Key? key,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController starRatingController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userProfile.name;
    roleController.text = widget.userProfile.role;
    locationController.text = widget.userProfile.location;
    starRatingController.text = widget.userProfile.starRating.toString();
    phoneNumberController.text = widget.userProfile.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: roleController,
              decoration: const InputDecoration(labelText: 'Barber/Customer'),
            ),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: starRatingController,
              decoration: const InputDecoration(labelText: 'Star Rating'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update the profile information with the values from the controllers
                Provider.of<UserProfileViewModel>(context, listen: false)
                    .updateProfile(UserProfile(
                  name: nameController.text,
                  role: roleController.text,
                  location: locationController.text,
                  starRating: int.tryParse(starRatingController.text) ?? 0,
                  phoneNumber: phoneNumberController.text,
                  profilePicture: 'assets/profile_picture.jpg',
                ));

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
