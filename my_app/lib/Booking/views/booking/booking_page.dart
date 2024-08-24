import 'package:flutter/material.dart';
import 'package:my_app/Booking/services/booking/booking_service_impl_memory.dart';
import 'package:my_app/Booking/services/schedule/schedule_impl_memory.dart';
import 'package:my_app/Booking/views/booking/barber/booking_barber.dart';
import 'package:my_app/Booking/views/schedule/schedule_page.dart';
import 'package:my_app/Configs/routes.dart';
import 'barber/booking_app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatelessWidget {
  final DateTime selectedValue = DateTime.now();
  final BookingServiceImplMemory bookingService = BookingServiceImplMemory();
  final ScheduleServiceImplMemory scheduleService = ScheduleServiceImplMemory();

  BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustBookingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Booking',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 16),
            const BookingBarber(),
            const SizedBox(height: 16),
            const Text(
              'Choose Your Time',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.now().subtract(const Duration(days: 365)),
                  lastDay: DateTime.now().add(const Duration(days: 365)),
                  calendarFormat: CalendarFormat.week,
                  onFormatChanged: (format) {},
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  selectedDayPredicate: (DateTime day) {
                    return isSameDay(selectedValue, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    // Handle day selection if needed
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: bookingService.getAllBookings().length,
                itemBuilder: (context, index) {
                  final booking = bookingService.getAllBookings()[index];
                  return Container(
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
                                booking.name,
                                style: const TextStyle(),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Haircut Type',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(booking.haircutType),
                              const SizedBox(height: 8),
                              const Text(
                                'Time',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(booking.time),
                              const SizedBox(height: 8),
                              const Text(
                                'Price',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('RM${booking.price}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SchedulePage(scheduleService: scheduleService),
                      ),
                    );
                  },
                  child: const Text('Continue to Schedule'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
