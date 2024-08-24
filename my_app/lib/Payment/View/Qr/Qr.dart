import 'package:flutter/material.dart';

class QrPayment extends StatelessWidget {
  const QrPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Payment'),
      ),
      body: FractionallySizedBox(
        heightFactor: 0.75,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Image.network(
              'https://help.myfave.com/hc/article_attachments/4404288704921/RPPDuitNowQR_POSM_v11_front.jpg', // Replace with the actual URL of your QR image
              width: double.infinity, // Adjust the width as needed
              height: double.infinity, // Adjust the height as needed
              fit: BoxFit.contain, // Adjust the BoxFit as needed
            ),
          ),
        ),
      ),
    );
  }
}
