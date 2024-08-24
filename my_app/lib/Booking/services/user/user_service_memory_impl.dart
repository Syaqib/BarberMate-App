import 'package:my_app/Booking/models/user.dart';
import 'package:my_app/Booking/services/user/user_service.dart';

class UserServiceMemoryImpl implements UserService {
  final List<User> _users = [
    User(
      id: '1',
      name: 'Najmi',
      role: 'Barber',
      starRating: 5,
      description: 'Experienced stylist',
    ),
  ];

  @override
  Future<User> getUserById(String id) async {
    User user = _users.firstWhere((u) => u.id == id);
    return user;
  }

  @override
  Future<List<User>> getAllUsers() async {
    return [..._users];
  }

  @override
  Future<void> addUser(User user) async {
    _users.add(user);
  }

  @override
  Future<User> getDefaultUser() async {
    return _users.isNotEmpty
        ? _users[0]
        : User(
            id: 'default',
            name: 'DefaultUser',
            role: 'DefaultRole',
            starRating: 0,
            description: 'DefaultDescription',
          );
  }
}
