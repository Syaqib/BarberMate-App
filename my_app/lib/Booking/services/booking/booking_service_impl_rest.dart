//booking_service_impl_rest

import 'package:my_app/Booking/models/booking.dart';
// import 'package:my_app/Booking/models/user.dart';
import 'package:my_app/Booking/services/booking/booking_service.dart';

class BookingServiceImplRest implements BookingService {
  final List<Booking> _bookings = [];

  @override
  void addBooking(Booking booking) {
    _bookings.add(booking);
  }

  @override
  void deleteBooking(String id) {
    _bookings.removeWhere((booking) => booking.id == id);
  }

  @override
  List<Booking> getAllBookings() {
    return _bookings;
  }

  @override
  Booking getBookingById(String id) {
    return _bookings.firstWhere((booking) => booking.id == id);
  }

  @override
  void updateBooking(String id, Booking data) {
    var index = _bookings.indexWhere((booking) => booking.id == id);
    if (index != -1) {
      _bookings[index] = data;
    }
  }

  @override
  Booking getActiveBooking() {
    throw UnimplementedError();
  }
}
