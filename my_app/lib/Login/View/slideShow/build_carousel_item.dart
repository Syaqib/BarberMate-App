import 'package:flutter/material.dart';

class buildCarouselItem extends StatelessWidget {
  const buildCarouselItem({
    super.key,
    required this.imageUrl,
    required this.caption,
  });

  final String imageUrl;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFFF1F0EF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            height: 250.0,
            width: 350.0,
          ),
          const SizedBox(height: 10.0),
          Text(
            caption,
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
