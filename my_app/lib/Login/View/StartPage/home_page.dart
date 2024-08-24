import 'package:flutter/material.dart';

import '../StartPage/showCarouselModal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showCarouselModal(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white], // Adjust the colors as needed
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'This is the home page.',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  showCarouselModal(context);
                },
                child: const Text('Let\'s Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
