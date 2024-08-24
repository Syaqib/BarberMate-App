import 'package:my_app/Booking/models/customer.dart';

class Booking {
  final String id;
  final String name;
  final String haircutType;
  final String time;
  final double price;
  final List<Customer> customers;

  Booking({
    required this.id,
    required this.name,
    required this.haircutType,
    required this.time,
    required this.price,
    required this.customers,
  });
}
