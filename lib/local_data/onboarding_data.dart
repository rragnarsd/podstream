import 'package:flutter/material.dart';

class OnboardingData {
  final String title;
  final String description;
  final String image;
  final Color color;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
    required this.color,
  });
}

List<OnboardingData> onboardingData = [
  OnboardingData(
    title: 'Aenean imperdiet',
    description: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
    image: 'assets/avatar8.png',
    color: Colors.red,
  ),
  OnboardingData(
    title: 'Sed fringilla mauris',
    description:
        'Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.',
    image: 'assets/avatar9.png',
    color: Colors.blue,
  ),
  OnboardingData(
    title: 'Dolor sit ameth',
    description:
        'Nullam dictum felis eu pede mollis pretium. Integer tincidunt.',
    image: 'assets/avatar10.png',
    color: Colors.green,
  ),
];
