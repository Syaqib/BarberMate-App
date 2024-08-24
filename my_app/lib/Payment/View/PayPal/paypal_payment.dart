import 'package:flutter/material.dart';

class PayPalPayment extends StatelessWidget {
  const PayPalPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PayPal Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Billing Information Form
            const Text(
              'Billing Information',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'City'),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Country'),
            ),
            const SizedBox(height: 16.0),

            // Card Information Form
            const Text(
              'Card Information',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Card Number'),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Expiration Date'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'CVV'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Payment Button
            ElevatedButton(
              onPressed: () {
                // Implement payment logic here
              },
              child: const Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}