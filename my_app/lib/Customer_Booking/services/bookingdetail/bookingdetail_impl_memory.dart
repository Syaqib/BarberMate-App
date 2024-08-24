import 'package:my_app/Customer_Booking/models/bookingdetail.dart';
import 'package:my_app/Customer_Booking/services/bookingdetail/bookingdetail_service.dart';

class BookingDetailCustomerServiceImpl implements BookingDetailServiceCustomer {
  @override
  Future<List<BookingDetailView>> fetchServices() async {
    List<BookingDetailView> services = [
      BookingDetailView(
        haircutType: 'Regular Cut',
        price: 50.0,
      ),
    ];
    return services;
  }
}
