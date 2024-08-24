import 'package:map_mvvm/view/viewmodel.dart';
import 'package:my_app/Configs/service_locator.dart';
import 'package:my_app/Login/Models/loginModel.dart';
import 'package:my_app/Login/Services/Login/LoginService.dart';

class HomeViewModel extends Viewmodel {

  List<LoginModel> _login = [];
  
  final LoginService _loginServices = locator();

  List<LoginModel> get login => _login;
  int get count => _login.length;

  Future<void> addNewUser(LoginModel login) async {
    LoginModel added = await _loginServices.addUser(login);
    _login.add(added);
    update();
  }

  Future<void> editUser(String username,String type, String password, String userId, LoginModel toUpdate) async {
    LoginModel updated = await _loginServices.updateUser(username,type, password,userId); 
    int index = _login.indexWhere((login) => login.username == username); 
    _login[index] = updated; 
    update();
  }

  Future<void> deleteUser(String username, String password) async {
    _loginServices.deleteUser(username, password);
    _login.removeWhere((LoginModel login) => login.username == username);
    update(); 
  }

  Future<void> getAllUser() async {
    final list = await _loginServices.getAllUser(); 
    _login = list;
    update();
  }
}

