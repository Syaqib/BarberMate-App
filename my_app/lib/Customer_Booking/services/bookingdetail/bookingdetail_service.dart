import 'package:my_app/Customer_Booking/models/bookingdetail.dart';

abstract class BookingDetailServiceCustomer {
  Future<List<BookingDetailView>> fetchServices();
}
