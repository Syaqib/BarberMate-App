import 'package:my_app/Customer_Booking/services/booking/booking_service.dart';
import '../../models/booking.dart';

class BookingServiceCustomerImplMemory implements BookingServiceCustomer {
  static final List<Booking> _bookings = [
    Booking(
      id: '1',
      userId: 'user1',
      name: 'John Doe',
      haircutType: 'Haircut',
      time: '10:00 AM',
      selectedDate: DateTime.now(),
      price: 0.0,
    ),
    // Add more pre-booked slots as needed
  ];

  // Add additional slots that are not available
  static final List<String> _unavailableSlots = ['2:00 PM', '3:30 PM'];

  @override
  List<String> getBookedSlots(String userId, DateTime selectedDate) {
    // Fetch booked slots for the selected date and user
    List<String> bookedSlots = [];
    for (Booking booking in _bookings) {
      if (booking.userId == userId &&
          booking.selectedDate.isAtSameMomentAs(selectedDate)) {
        bookedSlots.add(booking.time);
      }
    }
    return bookedSlots;
  }

  @override
  bool isSlotAvailable(
      String userId, String selectedTime, List<String> bookedSlots) {
    // Check both booked slots and additional unavailable slots
    return !bookedSlots.contains(selectedTime) &&
        !_unavailableSlots.contains(selectedTime);
  }

  @override
  Booking createBooking(
      String userId, String name, String haircut, String selectedTime,
      {required DateTime selectedDate}) {
    // Create a new booking and add it to the in-memory storage
    Booking newBooking = Booking(
      id: DateTime.now().toString(),
      userId: userId,
      name: name,
      haircutType: haircut,
      time: selectedTime,
      selectedDate: selectedDate,
      price: 0.0, // Set the actual price based on your business logic
    );

    _bookings.add(newBooking);
    return newBooking;
  }
}
