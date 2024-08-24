//schedule_page.dart

import 'package:flutter/material.dart';
import 'package:my_app/Booking/models/schedule.dart';
import 'package:my_app/Booking/services/schedule/schedule_impl_memory.dart';
import '../history/history_page.dart';

class SchedulePage extends StatelessWidget {
  final ScheduleServiceImplMemory scheduleService;

  const SchedulePage({
    Key? key,
    required this.scheduleService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Schedule> schedules = scheduleService.getAllSchedules();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('BarberMate'),
        actions: [
          IconButton(
            onPressed: () {
              List<Map<String, dynamic>> scheduleMaps =
                  schedules.map((schedule) => schedule.toMap()).toList();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryPage(schedules: scheduleMaps),
                ),
              );
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Schedule Today',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              // Display customer info containers
              for (var schedule in schedules)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                    // Change background color based on isDone status
                    color: schedule.isDone ? Colors.grey : Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.person, size: 40),
                              const SizedBox(width: 16),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      schedule.name,
                                      style: const TextStyle(),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Haircut Type',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(schedule.haircutType),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Time',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(schedule.time),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Price',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('RM${schedule.price}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: ElevatedButton(
                          onPressed: () {
                            markScheduleAsDone(schedule.id);
                          },
                          child: const Text('Done'),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void markScheduleAsDone(String id) {
    print('Marking schedule as done: $id');
    scheduleService.markScheduleAsDone(id);
  }
}
