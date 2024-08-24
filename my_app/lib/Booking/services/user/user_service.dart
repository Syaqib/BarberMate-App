import 'package:my_app/Booking/models/user.dart';

abstract class UserService {
  Future<User> getUserById(String id);
  Future<List<User>> getAllUsers();
  Future<void> addUser(User user);
  Future<User> getDefaultUser();
}
