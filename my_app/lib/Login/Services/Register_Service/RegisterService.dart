
import 'package:my_app/Login/Models/RegistrationModel.dart';

abstract class RegisterService 
{
  Future<RegistrationModel> addUser(RegistrationModel register); // INSERT USER
  Future<RegistrationModel> updateUser(RegistrationModel register); // UPDATE USER 
}

