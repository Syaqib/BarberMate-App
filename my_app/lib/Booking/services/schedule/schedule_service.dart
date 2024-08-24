// schedule_service.dart

import 'package:my_app/Booking/models/schedule.dart';

class ScheduleService {
  final List<Schedule> schedules;

  ScheduleService({required this.schedules});

  List<Schedule> getAllSchedules() {
    return schedules.toList();
  }

  void markScheduleAsDone(String id) {
    final schedule = schedules.firstWhere((schedule) => schedule.id == id);
    schedule.isDone = true;
  }
}
