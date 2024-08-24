import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> schedules;
  const HistoryPage({
    Key? key,
    required this.schedules,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> completedSchedules =
        schedules.where((history) => history['isDone'] == true).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('BarberMate'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'History',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              // Display customer info containers
              for (var history in completedSchedules)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.person, size: 40),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              history['name'],
                              style: const TextStyle(),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Haircut Type',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(history['haircutType']),
                            const SizedBox(height: 8),
                            const Text(
                              'Time',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(history['time']),
                            const SizedBox(height: 8),
                            const Text(
                              'Price',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('RM${history['price']}'),
                          ],
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
}
