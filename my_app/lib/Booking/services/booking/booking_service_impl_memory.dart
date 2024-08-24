import 'package:my_app/Booking/models/booking.dart';
import 'package:my_app/Booking/models/customer.dart';
import 'package:my_app/Booking/services/booking/booking_service.dart';

class BookingServiceImplMemory implements BookingService {
  final List<Booking> _bookings = [
    Booking(
      id: '1',
      name: 'Zulfadhly',
      haircutType: 'Classic Shaving',
      time: '10:00 AM',
      price: 20.0,
      customers: [],
    ),
    Booking(
      id: '2',
      name: 'Najmi',
      haircutType: 'Haircut',
      time: '11:00 AM',
      price: 15.0,
      customers: [],
    ),
    Booking(
      id: '3',
      name: 'Kristy Yap',
      haircutType: 'Hair Colour',
      time: '11:30 PM',
      price: 30.0,
      customers: [],
    ),
  ];

  @override
  Future<void> addBooking(Booking booking) async {
    _bookings.add(booking);
  }

  @override
  void deleteBooking(String id) {
    _bookings.removeWhere((booking) => booking.id == id);
  }

  @override
  List<Booking> getAllBookings() {
    // Updated to return the list of bookings
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
    // For simplicity, just return the first booking as the active booking
    if (_bookings.isNotEmpty) {
      return _bookings.first;
    }
    throw StateError('No active booking found.');
  }
}
