// home_viewmodel.dart

import 'package:my_app/Customer_Booking/models/bookingdetail.dart';
import 'package:my_app/Customer_Booking/models/home.dart';
import 'package:my_app/Customer_Booking/models/user.dart';
import 'package:my_app/Customer_Booking/services/booking/booking_service.dart';
import 'package:my_app/Customer_Booking/services/bookingdetail/bookingdetail_service.dart';
import 'package:my_app/Customer_Booking/services/home/home_service.dart';
import 'package:my_app/Customer_Booking/services/user/user_service.dart';
import 'package:my_app/configs/service_locator.dart';
import 'package:map_mvvm/view/viewmodel.dart';

class HomeViewModel extends Viewmodel {
  User? _customer;
  User? get customer => _customer;
  String get name => _customer?.name ?? '';
  String get role => _customer?.role ?? '';
  String get description => _customer?.description ?? '';

  final UserServiceCustomer _userService = locator();
  final HomeServiceCustomer _homeService = locator();
  final BookingServiceCustomer _bookingService = locator();
  final BookingDetailServiceCustomer _bookingDetailService = locator();

  Future<void> getCustomer(String id) async {
    _customer = await _userService.getUserById(id);
    update();
  }

  List<Home> getAvailableServices() {
    return _homeService.getAvailableServices();
  }

  void selectService(Home service) {
    _homeService.selectService(service);
    update();
  }

  Home? get selectedService => _homeService.selectedService;

  // Updated methods from BookingService

  List<String> getBookedSlots(DateTime selectedDate) {
    // Pass user ID to getBookedSlots
    String userId = _customer?.id ?? '';
    return _bookingService.getBookedSlots(userId, selectedDate);
  }

  bool isSlotAvailable(String selectedTime, List<String> bookedSlots) {
    // Pass user ID to isSlotAvailable
    String userId = _customer?.id ?? '';
    return _bookingService.isSlotAvailable(userId, selectedTime, bookedSlots);
  }

  // New methods related to BookingDetailService

  Future<List<BookingDetailView>> fetchBookingDetailServices() async {
    return _bookingDetailService.fetchServices();
  }

  @override
  void init() {
    getCustomer('Amirul Haziq');
    super.init();
  }
}
