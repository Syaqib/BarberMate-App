import 'package:map_mvvm/view/viewmodel.dart';
import 'package:my_app/Booking/services/user/user_service_memory_impl.dart';
import '../Services/UserProfile/userprofile_memory_impl.dart';
import '../models/user_details.dart';

class UserProfileViewModel extends Viewmodel {
  late UserProfile _userProfile;
  final UserProfileMemoryImpl _userProfileMemoryImpl =
      UserProfileMemoryImpl(UserServiceMemoryImpl());

  UserProfileViewModel() {
    _userProfile = UserProfile(
      name: '',
      role: '',
      location: '',
      starRating: 0,
      phoneNumber: '',
      profilePicture: '',
    );
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    _userProfile = await _userProfileMemoryImpl.getUserProfile();
    notifyListeners();
  }

  UserProfile get userProfile => _userProfile;

  Future<void> updateProfile(UserProfile updatedProfile) async {
    await _userProfileMemoryImpl.updateUserProfile(updatedProfile);
    _userProfile = updatedProfile;
    notifyListeners();
  }
}
