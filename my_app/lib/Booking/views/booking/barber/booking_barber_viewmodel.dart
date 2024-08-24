import 'package:map_mvvm/view/viewmodel.dart';
import 'package:my_app/Booking/models/user.dart';
import 'package:my_app/Booking/services/user/user_service.dart';
import 'package:my_app/Configs/service_locator.dart';

class BookingBarberViewmodel extends Viewmodel {
  User? _barber;
  User? get barber => _barber;
  String get name => _barber?.name ?? 'Unknown'; // Add null check

  final UserService _userService = locator();

  Future<void> getBarber(String id) async {
    _barber = await _userService.getUserById(id);
    update();
  }

  @override
  void init() {
    getBarber("1"); // Specify the user ID
    super.init();
  }
}
