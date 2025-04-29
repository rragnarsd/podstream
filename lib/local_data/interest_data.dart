import 'package:flutter/material.dart';

List<InterestData> interests = [
  InterestData(
    interest: 'Technology',
    isSelected: false,
    color: Colors.blue,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Science',
    isSelected: false,
    color: Colors.green,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Business',
    isSelected: false,
    color: Colors.purple,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Health',
    isSelected: false,
    color: Colors.red,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Education',
    isSelected: false,
    color: Colors.orange,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Politics',
    isSelected: false,
    color: Colors.indigo,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'History',
    isSelected: false,
    color: Colors.brown,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Art',
    isSelected: false,
    color: Colors.pink,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Music',
    isSelected: false,
    color: Colors.teal,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Sports',
    isSelected: false,
    color: Colors.amber,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Travel',
    isSelected: false,
    color: Colors.cyan,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Food',
    isSelected: false,
    color: Colors.deepOrange,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Fashion',
    isSelected: false,
    color: Colors.deepPurple,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Lifestyle',
    isSelected: false,
    color: Colors.lightBlue,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Entertainment',
    isSelected: false,
    color: Colors.lightGreen,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'News',
    isSelected: false,
    color: Colors.lime,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Gaming',
    isSelected: false,
    color: Colors.yellow,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'True Crime',
    isSelected: false,
    color: Colors.redAccent,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Comedy',
    isSelected: false,
    color: Colors.amberAccent,
    textColor: Colors.black,
  ),
];

class InterestData {
  final String interest;
  final bool isSelected;
  final Color color;
  final Color textColor;

  InterestData({
    required this.interest,
    required this.isSelected,
    required this.color,
    required this.textColor,
  });
}
