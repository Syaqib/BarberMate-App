// booking_model.dart
class Booking {
  final String id;
  final String userId;
  final String name;
  final String haircutType;
  final String time;
  final double price;
  final DateTime selectedDate;

  Booking({
    required this.id,
    required this.userId,
    required this.name,
    required this.haircutType,
    required this.time,
    required this.price,
    required this.selectedDate,
  });
}
