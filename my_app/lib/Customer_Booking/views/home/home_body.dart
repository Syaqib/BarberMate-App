// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/Customer_Booking/models/home.dart';
import 'package:my_app/Customer_Booking/views/home/home_app_bar.dart';
import 'package:my_app/Customer_Booking/views/home/home_viewmodel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:map_mvvm/view/view.dart';

import '../../../Payment/View/Payment/payment.dart';

enum HomeScreen {
  ServiceSelection,
  Booking,
  BookingDetail,
}

class CustBookingBody extends StatefulWidget {
  const CustBookingBody({Key? key});

  @override
  _CustBookingBodyState createState() => _CustBookingBodyState();
}

class _CustBookingBodyState extends State<CustBookingBody> {
  late HomeViewModel viewModel;
  final String _searchQuery = '';

  HomeScreen currentScreen = HomeScreen.ServiceSelection;

  String selectedDay = "Mon"; // Example selected day
  DateTime? _selectedValue; // Change to nullable DateTime
  String selectedTime = "";

  int selectedServiceIndex = -1; // Track selected service index

  @override
  void initState() {
    viewModel = HomeViewModel();
    viewModel.init(); // Fetch the initial user data during initialization
    super.initState();
  }

  void _toggleBookingMode() {
    setState(() {
      switch (currentScreen) {
        case HomeScreen.ServiceSelection:
          if (selectedServiceIndex == -1) {
            _showServiceSelectionErrorDialog();
            return;
          }
          currentScreen = HomeScreen.Booking;
          break;
        case HomeScreen.Booking:
          if (_selectedValue == null || selectedTime.isEmpty) {
            _showIncompleteSelectionErrorDialog();
            return;
          }
          currentScreen = HomeScreen.BookingDetail;
          break;
        case HomeScreen.BookingDetail:
          // Additional logic if needed
          break;
      }
    });
  }

  void _showIncompleteSelectionErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Please choose both date and time.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<HomeViewModel>(
      builder: (context, viewModel) {
        return Scaffold(
          appBar: const HomeAppBar(),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildUserInfoContainer(viewModel),
                  const SizedBox(height: 20),
                  _buildScreenContent(context),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (currentScreen != HomeScreen.ServiceSelection)
                        ElevatedButton(
                          onPressed: () {
                            _navigateBack();
                          },
                          child: const Text('Back'),
                        ),
                      ElevatedButton(
                        onPressed: () {
                          _toggleBookingMode();
                        },
                        child: Text(_getButtonLabel()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildScreenContent(BuildContext context) {
    switch (currentScreen) {
      case HomeScreen.ServiceSelection:
        return _buildServiceSelectionContent(context);
      case HomeScreen.Booking:
        return _buildBookingContent();
      case HomeScreen.BookingDetail:
        return _buildBookingDetailContent();
    }
  }

  Widget _buildServiceSelectionContent(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'SERVICES',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        _buildServiceRows(context, viewModel.getAvailableServices()),
      ],
    );
  }

  Widget _buildBookingContent() {
    return _buildBookingCalendarAndTimeSelection();
  }

  Widget _buildBookingDetailContent() {
    return _buildSelectedServiceContainer();
  }

  Widget _buildUserInfoContainer(HomeViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
                Text(
                  viewModel.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  viewModel.role,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 8),
                Text(
                  viewModel.description,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceRows(BuildContext context, List<Home> services) {
    List<Home> filteredServices = services
        .where((service) => service.haircutType
            .toLowerCase()
            .contains(_searchQuery.toLowerCase()))
        .toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: filteredServices
              .sublist(0, 2)
              .map((service) => _buildServiceBox(
                  context, service, filteredServices.indexOf(service)))
              .toList(),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: filteredServices
              .sublist(2, 4)
              .map((service) => _buildServiceBox(
                  context, service, filteredServices.indexOf(service)))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildServiceBox(BuildContext context, Home service, int index) {
    return GestureDetector(
      onTap: () => _onServiceBoxPressed(context, service, index),
      child: Container(
        width: 140,
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
          color: selectedServiceIndex == index ? Colors.blue : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 80,
              color: Colors.black,
            ),
            const SizedBox(height: 8),
            Text(
              service.haircutType,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'RM${service.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedServiceContainer() {
    final selectedService = viewModel.selectedService;

    return Column(
      children: [
        if (selectedService != null)
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Booking Details:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Services: ${selectedService.haircutType}',
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 8),
                Text(
                  'Price: RM${selectedService.price.toStringAsFixed(2)}',
                ),
                if (_selectedValue != null && selectedTime.isNotEmpty)
                  Column(
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'Date: ${DateFormat('MMMM dd, yyyy').format(_selectedValue!)}',
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Time: $selectedTime',
                      ),
                    ],
                  ),
              ],
            ),
          ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            _navigateToChoosePayment();
          },
          child: const Text('Go to Payment'),
        ),
      ],
    );
  }

  void _navigateToChoosePayment() {
    // Navigate to ChoosePayment page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChoosePayment()),
    );
  }

  Widget _buildBookingCalendarAndTimeSelection() {
    return Column(
      children: [
        const Text(
          'Choose Your Date',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
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
          selectedDayPredicate: (day) {
            return isSameDay(_selectedValue, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedValue = selectedDay;
            });
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'Choose Your Time',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTimeButton('10:00 AM'),
            _buildTimeButton('11:30 AM'),
            _buildTimeButton('2:00 PM'),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTimeButton('3:30 PM'),
            _buildTimeButton('5:00 PM'),
            _buildTimeButton('6:30 PM'),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTimeButton(String time) {
    bool isAvailable = true; // Placeholder value, replace with your logic

    return ElevatedButton(
      onPressed: isAvailable
          ? () {
              setState(() {
                selectedTime = time;
              });
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedTime == time ? Colors.blue : null,
      ),
      child: Text(time),
    );
  }

  void _showServiceSelectionErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Please select your services.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  void _showTimeSlotErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Please choose your time slot.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  void _onServiceBoxPressed(BuildContext context, Home service, int index) {
    viewModel.selectService(service);
    setState(() {
      selectedServiceIndex = index;
    });
  }

  void _navigateBack() {
    setState(() {
      switch (currentScreen) {
        case HomeScreen.ServiceSelection:
          // Handle back navigation if needed
          break;
        case HomeScreen.Booking:
          currentScreen = HomeScreen.ServiceSelection;
          break;
        case HomeScreen.BookingDetail:
          currentScreen = HomeScreen.Booking;
          break;
      }
    });
  }

  String _getButtonLabel() {
    switch (currentScreen) {
      case HomeScreen.ServiceSelection:
        return 'Next';
      case HomeScreen.Booking:
        return 'Confirm Booking';
      case HomeScreen.BookingDetail:
        return 'Continue';
    }
  }
}
