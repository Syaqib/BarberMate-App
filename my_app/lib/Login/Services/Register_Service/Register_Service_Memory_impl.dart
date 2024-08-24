import 'package:my_app/Login/Models/RegistrationModel.dart';
import 'package:my_app/Login/Services/Register_Service/RegisterService.dart';


class RegisterServiceMemoryImpl implements RegisterService {
  final List<RegistrationModel> _register = [
    RegistrationModel(
        "aliff", "0000", "0123456789", "alep@gmail.com", "0000", "0000", ""),
    RegistrationModel(
        "najmi", "0000", "0123456789", "najmi@gmail.com", "0000", "0000", ""),
  ];

  @override
  Future<RegistrationModel> addUser(RegistrationModel register) {
    _register.add(register);
    return Future.value(register);
  }

  @override
  Future<RegistrationModel> updateUser(RegistrationModel register) {
    throw UnimplementedError();
  }
}
