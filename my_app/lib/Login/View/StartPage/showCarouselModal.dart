import 'package:flutter/material.dart';
import '../slideShow/carousel_slider.dart';


void showCarouselModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return MyCarouselSlider();
    },
  );
}
