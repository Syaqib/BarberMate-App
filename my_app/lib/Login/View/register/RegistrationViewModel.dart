import 'package:map_mvvm/view/viewmodel.dart';
import 'package:my_app/Configs/service_locator.dart';
import 'package:my_app/Login/Models/RegistrationModel.dart';
import 'package:my_app/Login/Services/Register_Service/RegisterService.dart';

class RegisterViewModel extends Viewmodel {
  List<RegistrationModel> _register = [];
  final RegisterService _registerServices = locator();
  List<RegistrationModel> get register => _register;
  int get count => _register.length;

  String _selectedUserType = 'User'; // Default value is 'User'

  String get selectedUserType => _selectedUserType;

  void setSelectedUserType(String? newValue) 
  {
    if (newValue != null) {
      _selectedUserType = newValue;
      update();
    }
  }

  Future<void> addNewUSer(RegistrationModel register) async {
    print(register.fullName);
    RegistrationModel added = await _registerServices.addUser(register);
    _register.add(added);
    update();
    //passUserData(register);
  }

  // Future<void> passUserData(RegistrationModel register) async {
  //   // Create a LoginModel from the RegistrationModel
  //   LoginModel loginModel =
  //       LoginModel();

  //   // Access the LoginViewModel
  //   LoginViewModel loginViewModel = locator<LoginViewModel>();

  //   // Add the new user to the login list
  //   await loginViewModel.addNewUser(loginModel);
  // }

}
