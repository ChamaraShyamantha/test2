import 'package:flutter/material.dart';

String uri = 'http://192.168.1.8:3000';

//for windows
//String uri = 'http://10.0.2.2:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Colors.teal,
      Colors.teal,
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Color(0xffebecee);
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Color.fromARGB(255, 235, 221, 99)!;
  static const unselectedNavBarColor = Colors.teal;
  // static const appbacrcolor = Color.fromARGB(124, 6, 133, 130);
  static const appbacrcolor = Colors.teal;

  // STATIC IMAGES
  static const List<String> carouselImages = [];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Liquids',
      'image': 'assets/images/Liquids.png',
    },
    {
      'title': 'Capsules',
      'image': 'assets/images/Capsules.png',
    },
    {
      'title': 'Inhalers',
      'image': 'assets/images/Inhalers.png',
    },
    {
      'title': 'Injections',
      'image': 'assets/images/Injections.png',
    },
    {
      'title': 'Patches',
      'image': 'assets/images/Patches.png',
    },
  ];

  static const textFieldProperty = TextStyle(
    fontSize: 13.0,
    // fontFamily: 'Source Sans Pro',
    fontWeight: FontWeight.w500,
  );
}
