import '../../../Booking/models/user.dart';
import '../../models/user_details.dart';
import 'userprofile_service.dart';
import 'package:my_app/Booking/services/user/user_service.dart';

class UserProfileMemoryImpl extends UserProfileService {
  final UserService _userService;

  UserProfile _userProfile = UserProfile(
    name: '',
    role: '',
    location: '',
    starRating: 5,
    phoneNumber: '',
    profilePicture: 'assets/profile_picture.jpg',
  );

  UserProfileMemoryImpl(this._userService);

  @override
  Future<UserProfile> getUserProfile() async {
    // Fetch data from UserServiceMemoryImpl
    List<User> users = await _userService.getAllUsers();

    // Assuming you want to update the profile based on the first user in the list
    if (users.isNotEmpty) {
      _userProfile = UserProfile(
        name: users[0].name,
        role: users[0].role,
        location: 'KTDI, UTM',
        starRating: 5,
        phoneNumber: '(60) 132-282635',
        profilePicture: 'assets/profile_picture.jpg',
        // Add other fields as needed
      );
    }

    return _userProfile;
  }

  @override
  Future<void> updateUserProfile(UserProfile updatedProfile) async {
    _userProfile = updatedProfile;
  }
}
