import 'package:my_app/Customer_Booking/models/home.dart';

abstract class HomeServiceCustomer {
  Home? get selectedService;
  void selectService(Home service);
  List<Home> getAvailableServices();
}
