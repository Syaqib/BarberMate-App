// routes.dart

import 'package:flutter/material.dart';
import 'package:my_app/Booking/services/schedule/schedule_impl_memory.dart';
import 'package:my_app/Booking/views/booking/booking_page.dart';
import 'package:my_app/Booking/views/history/history_page.dart';
import 'package:my_app/Booking/views/schedule/schedule_page.dart';

class Routes {
  static const String booking = '/booking';
  static const String history = '/history';
  static const String schedule = '/schedule';
  static const String home = '/home';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case booking:
        return MaterialPageRoute(builder: (_) => BookingPage());
      case history:
        // Define your schedules here or fetch them from somewhere
        List<Map<String, dynamic>> scheduleMaps = [
          {'name': 'Schedule 1', 'time': '10:00 AM', 'price': 20.0},
          // Add more schedule data as needed
        ];

        return MaterialPageRoute(
          builder: (_) => HistoryPage(schedules: scheduleMaps),
        );
      case schedule:
        final scheduleService = ScheduleServiceImplMemory();
        return MaterialPageRoute(
          builder: (_) => SchedulePage(scheduleService: scheduleService),
        );

      // case home:
      //   return MaterialPageRoute(builder: (_) => Home());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}
