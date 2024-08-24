import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:map_mvvm/view/view.dart';
import 'package:my_app/Payment/View/PayPal/paypal_payment.dart';
import 'package:my_app/Payment/View/Payment/payment_view_model.dart';
import 'package:my_app/Payment/View/Qr/Qr.dart';
import 'package:my_app/Payment/View/Visa/visa_payment.dart';

class ChoosePayment extends StatelessWidget {
  const ChoosePayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the current date and time
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('MMMM dd, yyyy').format(now);
    final String formattedTime = DateFormat('h:mm a').format(now);

    return ViewWrapper<PaymentViewModel>(builder: (context, viewmodel) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Choose Payment'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Total Payment:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '\$50.00',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Date: $formattedDate',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Time: $formattedTime',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Payment Method:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              viewmodel.setPaymentTypeValue("Visa");
                              // Navigate to VisaPayment page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const VisaPayment()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 249, 245,
                                    245), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the border radius
                              ),
                              width: 200.0, // Adjust the width as needed
                              height: 60.0, // Adjust the height as needed
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                'https://www.visa.com.my/dam/VCOM/regional/ve/romania/blogs/hero-image/visa-logo-800x450.jpg',
                                width: 50.0,
                                height: 30.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          InkWell(
                            onTap: () {
                              viewmodel.setPaymentTypeValue("PayPal");
                              // Navigate to PayPalPayment page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PayPalPayment()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 249, 245,
                                    245), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the border radius
                              ),
                              width: 200.0, // Adjust the width as needed
                              height: 60.0, // Adjust the height as needed
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                'https://imageio.forbes.com/blogs-images/steveolenski/files/2016/07/Mastercard_new_logo-1200x865.jpg?height=512&width=711&fit=bounds',
                                width: 50.0,
                                height: 30.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          InkWell(
                            onTap: () {
                              viewmodel.setPaymentTypeValue("Qr");
                              // Navigate to PayPalPayment page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const QrPayment()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 249, 245,
                                    245), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the border radius
                              ),
                              width: 200.0, // Adjust the width as needed
                              height: 60.0, // Adjust the height as needed
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                'https://pbs.twimg.com/profile_images/1188983284987879424/cIpJeCqi_400x400.jpg',
                                width: 50.0,
                                height: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
