import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget imageCarousel = new Container(
  height: 200.0,
  child: new CarouselSlider(
    items: [
      Image(
        image: AssetImage('images/c1.jpg'),
        fit: BoxFit.cover,
      ),
      Image(
        image: AssetImage('images/m1.jpeg'),
        fit: BoxFit.cover,
      ),
      Image(
        image: AssetImage('images/w3.jpeg'),
        fit: BoxFit.cover,
      ),
      Image(
        image: AssetImage('images/m2.jpg'),
        fit: BoxFit.cover,
      ),
      Image(
        image: AssetImage('images/IMG_1266.JPG'),
        fit: BoxFit.cover,
      ),
      Image(
        image: AssetImage(
          'images/c1.jpg',
        ),
        fit: BoxFit.cover,
      ),
      Image(
        image: AssetImage(
          'images/c1.jpg',
        ),
        fit: BoxFit.cover,
      ),
    ],
    // dotSize: 3.5,
    // indicatorBgPadding: 6.0,
    // dotBgColor: Colors.transparent,
    options: CarouselOptions(
      autoPlayCurve: Curves.fastOutSlowIn,
      autoPlayAnimationDuration: Duration(
        milliseconds: 1000,
      ),
      autoPlay: true,
      height: 400,
      pageSnapping: true,
      scrollDirection: Axis.horizontal,
    ),
  ),
);