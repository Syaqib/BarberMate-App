class Customer {
  final String name;
  final String haircutType;
  final String time;
  final double price;

  Customer({
    required this.name,
    required this.haircutType,
    required this.time,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'haircutType': haircutType,
      'time': time,
      'price': price,
    };
  }
}
