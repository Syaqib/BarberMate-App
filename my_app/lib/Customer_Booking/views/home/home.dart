import 'package:flutter/material.dart';
import 'package:my_app/Booking/views/booking/barber/booking_app_bar.dart';
import 'home_body.dart';

class CustBookingPage extends StatelessWidget {
  const CustBookingPage({super.key});

  get price => null;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustBookingAppBar(),
      body: CustBookingBody(),
    );
  }
}
