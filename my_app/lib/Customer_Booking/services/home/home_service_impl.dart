import 'package:my_app/Customer_Booking/models/home.dart';
import 'home_service.dart';

class HomeServiceCustomerImpl implements HomeServiceCustomer {
  Home? _selectedService;

  @override
  Home? get selectedService => _selectedService;

  @override
  void selectService(Home service) {
    _selectedService = service;
  }

  @override
  List<Home> getAvailableServices() {
    // For simplicity, the data is hardcoded here. In a real app, you might fetch it from an API or database.
    return [
      Home(haircutType: 'Classic Shaving', price: 20.0),
      Home(haircutType: 'Haircut', price: 15.0),
      Home(haircutType: 'Beard Trimming', price: 10.0),
      Home(haircutType: 'Hair Colour', price: 30.0),
    ];
  }
}
