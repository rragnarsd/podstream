import 'package:flutter/material.dart';

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

List<InterestData> interests = [
  InterestData(
    interest: 'Adventure',
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
    interest: 'Fairy Tales',
    isSelected: false,
    color: Colors.purple,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Sports',
    isSelected: false,
    color: Colors.red,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'School & Learning',
    isSelected: false,
    color: Colors.orange,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Animals',
    isSelected: false,
    color: Colors.indigo,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Bedtime Stories',
    isSelected: false,
    color: Colors.brown,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Art & Creativity',
    isSelected: false,
    color: Colors.pink,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Music & Songs',
    isSelected: false,
    color: Colors.teal,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Funny Stories',
    isSelected: false,
    color: Colors.amber,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Space & Planets',
    isSelected: false,
    color: Colors.cyan,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Dinosaurs',
    isSelected: false,
    color: Colors.deepOrange,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Superheroes',
    isSelected: false,
    color: Colors.deepPurple,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Friendship',
    isSelected: false,
    color: Colors.lightBlue,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Games & Puzzles',
    isSelected: false,
    color: Colors.lightGreen,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Magic & Fantasy',
    isSelected: false,
    color: Colors.lime,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Cooking for Kids',
    isSelected: false,
    color: Colors.yellow,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Myths & Legends',
    isSelected: false,
    color: Colors.redAccent,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Growing Up',
    isSelected: false,
    color: Colors.amberAccent,
    textColor: Colors.black,
  ),
];
