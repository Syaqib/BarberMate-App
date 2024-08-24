import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Login/View/register/userOption.dart';

import '../login/login.dart'; // Import the login modal
import '../register/register.dart';
import 'build_carousel_item.dart';

class MyCarouselSlider extends StatelessWidget {
  const MyCarouselSlider({Key? key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.75,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: IconButton(
                icon: Icon(Icons.arrow_downward),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the modal
                },
              ),
            ),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 350.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.9,
                ),
                items: [
                  buildCarouselItem(
                      imageUrl:
                          'https://assets-global.website-files.com/64277851f4875994f6a5388e/642eba075b124573aacd3ff7_How-Much-Does-a-Barber-Make-960x640.jpg',
                      caption: 'Welcome to Barbermate!'),
                  buildCarouselItem(
                      imageUrl:
                          'https://www.positive.news/wp-content/uploads/2023/01/iStock-1441549388-min-1800x0-c-center.jpg',
                      caption: 'Explore Our Services'),
                  buildCarouselItem(
                      imageUrl:
                          'https://www.shutterstock.com/image-photo/attractive-happy-man-smiling-while-600nw-2267242719.jpg',
                      caption: 'Book Your Appointment Now'),
                  // Add more items as needed
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the login modal
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext builderContext) {
                        return Login();
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 140.0, vertical: 20.0),
                    textStyle: TextStyle(fontSize: 18.0),
                  ),
                  child: Text('Login'),
                ),
                SizedBox(height: 20.0), // Adjust the spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the login modal
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext builderContext) {
                        return UserOption();
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 130.0, vertical: 20.0),
                    textStyle: TextStyle(fontSize: 18.0),
                  ),
                  child: Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
