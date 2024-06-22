

import 'package:flutter/material.dart';

const Color mainColor = Colors.indigoAccent;
const Color greenColor = Colors.green;
const Color redColor = Colors.red;
const Color orangeColor = Color(0xFFFF5F1F);
const Color textColors = Color(0xff17202A);
const Color secondTextColor = Colors.grey;


Color getColorFromName(String colorName) {
  switch (colorName.toLowerCase()) {
    case 'violet':
      return Colors.deepPurple;
    case 'verte':
      return Colors.greenAccent;
    case 'bleu':
      return Colors.lightBlueAccent;
    case 'rose':
      return Colors.pinkAccent;
    case 'orange':
      return Colors.deepOrange;
    case 'grise':
      return Colors.grey;
  // Add more cases as needed
    default:
      return Colors.blueGrey; // Default color
  }
}


// blue color
//color hunt
