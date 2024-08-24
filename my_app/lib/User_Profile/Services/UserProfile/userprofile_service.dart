import '../../models/user_details.dart';

abstract class UserProfileService {
  Future<UserProfile> getUserProfile();
  Future<void> updateUserProfile(UserProfile updatedProfile);
}
