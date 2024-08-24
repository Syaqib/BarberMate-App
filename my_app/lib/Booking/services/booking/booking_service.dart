import 'package:my_app/Booking/models/booking.dart';

abstract class BookingService {
  void addBooking(Booking booking);
  void updateBooking(String id, Booking data);
  void deleteBooking(String id);
  Booking getBookingById(String id);
  List<Booking> getAllBookings();

  // new
  Booking getActiveBooking();
}
