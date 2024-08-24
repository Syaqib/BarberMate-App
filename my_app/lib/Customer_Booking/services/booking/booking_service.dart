import '../../models/booking.dart';

abstract class BookingServiceCustomer {
  List<String> getBookedSlots(String userId, DateTime selectedDate);
  bool isSlotAvailable(
      String userId, String selectedTime, List<String> bookedSlots);
  Booking createBooking(
      String userId, String name, String haircut, String selectedTime,
      {required DateTime selectedDate});
}
