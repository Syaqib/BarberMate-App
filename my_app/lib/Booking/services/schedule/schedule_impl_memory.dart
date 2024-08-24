// schedule_impl_memory.dart

import 'package:my_app/Booking/models/schedule.dart';

class ScheduleServiceImplMemory {
  final List<Schedule> _schedules = [
    Schedule(
      id: '1',
      name: 'Zulfadhly',
      haircutType: 'Classic Shaving',
      time: '10:00 AM',
      price: 20.0,
      isDone: false,
    ),
    Schedule(
      id: '2',
      name: 'Najmi',
      haircutType: 'Haircut',
      time: '11:00 AM',
      price: 15.0,
      isDone: false,
    ),
    Schedule(
      id: '3',
      name: 'Kristy Yap',
      haircutType: 'Hair Colour',
      time: '11:30 PM',
      price: 30.0,
      isDone: false,
    ),
  ];

  List<Schedule> getAllSchedules() {
    return _schedules.where((schedule) => !schedule.isDone).toList();
  }

  void markScheduleAsDone(String id) {
    final schedule = _schedules.firstWhere((schedule) => schedule.id == id);
    schedule.isDone = true;
  }
}
