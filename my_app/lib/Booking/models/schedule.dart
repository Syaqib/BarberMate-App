class Schedule {
  final String id;
  final String name;
  final String haircutType;
  final String time;
  final double price;
  bool isDone;

  Schedule({
    required this.id,
    required this.name,
    required this.haircutType,
    required this.time,
    required this.price,
    this.isDone = false,
  });

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      id: map['id'],
      name: map['name'],
      haircutType: map['haircutType'],
      time: map['time'],
      price: map['price'],
      isDone: map['isDone'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'haircutType': haircutType,
      'time': time,
      'price': price,
      'isDone': isDone,
    };
  }
}
