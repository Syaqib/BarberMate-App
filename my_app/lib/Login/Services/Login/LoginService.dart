import 'package:my_app/Login/Models/loginModel.dart';

abstract class LoginService {
  // CRUD

  Future<LoginModel> getUserByUsername(
      String username); // SELECT * from username where username.id = id
  Future<LoginModel> getUserByPassword(String password);
  Future<List<LoginModel>> getAllUser(); // SELECT * from username
  Future<LoginModel> addUser(
      LoginModel login); // INSERT INTO username VALUES (........)
  Future<void> deleteUser(
      String username, String password); // DELETE FROM User WHERE username =
  Future<LoginModel> updateUser(String username, String type,
      String password, String userId); // UPDATE USER SET username = new.username
}

// Talking to external resources takes some time.
// API uses async call
