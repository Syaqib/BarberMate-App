import 'package:my_app/Login/Models/loginModel.dart';
import 'package:my_app/Login/Services/Login/LoginService.dart';

// defining login service to make use of internal memory approach

class LoginServiceMemoryImpl implements LoginService {
  final List<LoginModel> _login = [
    LoginModel(username: "user1", type: "barber", password: "pass1", userId: "userId01"),
    LoginModel(username: "user2", type: "customer", password: "pass2",userId:"userId02"),
    LoginModel(username: "user3", type: "barber", password: "pass3", userId: "userId03"),
    LoginModel(username: "user4", type: "payment", password: "pass4", userId: "userId04"),
    LoginModel(username: "user5", type: "customerBooking", password: "pass5", userId: "userId05"),
  ];

  @override
  Future<LoginModel> addUser(LoginModel login) async {
    String username = "${int.parse(_login.last.username) + 1}";
    login.username = username;
    _login.add(login);
    return login;
  }

  @override
  Future<void> deleteUser(String username, String password) async {
    _login.removeWhere(
        (login) => login.username == username && login.password == password);
  }

  @override
  Future<List<LoginModel>> getAllUser() async {
    return _login;
  }

  @override
  Future<LoginModel> getUserByUsername(String username) async {
    LoginModel result =
        _login.firstWhere((login) => login.username == username);
    return result;
  }

  @override
  Future<LoginModel> updateUser(
      String username, String type, String password, String userId) async {
    int index = _login.indexWhere((login) => login.username == username);
    _login[index] = LoginModel(username: username, type: type, password: password, userId: userId);
    return LoginModel(username: username, type: type, password: password, userId: userId);
  }

  @override
  Future<LoginModel> getUserByPassword(String password) async {
    LoginModel result = _login.lastWhere((login) => login.password == password);
    return result;
  }
}
