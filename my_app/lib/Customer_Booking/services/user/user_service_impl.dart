import '../../models/user.dart';
import 'user_service.dart';

class UserServiceCustomerMemoryImpl implements UserServiceCustomer {
  final List<User> _users = [
    User(
        id: '1',
        name: 'Amirul Haziq',
        role: 'Customer',
        description: 'Young Man')
  ];

  @override
  Future<List<User>> getAllUser() async {
    return [..._users];
  }

  @override
  Future<User> getUserById(String id) async {
    String id = '1';
    User user = _users.firstWhere((u) => u.id == id);
    return user;
  }
}
