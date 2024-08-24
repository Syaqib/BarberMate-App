import 'package:my_app/Booking/models/schedule.dart';
import 'package:my_app/Booking/services/schedule/schedule_service.dart';
import 'package:my_app/Configs/service_locator.dart';
import 'package:map_mvvm/view/viewmodel.dart';

class ScheduleViewModel extends Viewmodel {
  final ScheduleService _scheduleService = locator<ScheduleService>();

  List<Schedule> get activeSchedules => _scheduleService
      .getAllSchedules()
      .where((schedule) => !schedule.isDone)
      .toList();

  List<Schedule> get completedSchedules => _scheduleService
      .getAllSchedules()
      .where((schedule) => schedule.isDone)
      .toList();

  void markScheduleAsDone(String id) {
    _scheduleService.markScheduleAsDone(id);
    update();
    {
      print('Schedule marked as done: $id');
    }
  }
}
