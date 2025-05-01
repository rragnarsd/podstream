import 'package:flutter/material.dart';
import 'package:podstream/utils/pod_assets.dart';

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
    title: 'Welcome to Your Story World!',
    description:
        'Discover amazing stories, fun facts, and exciting adventures made just for you!',
    image: AppAssets.avatar8,
    color: Colors.blue,
  ),
  OnboardingData(
    title: 'Learn While Having Fun',
    description:
        'Explore science, history, and cool facts through engaging stories and podcasts!',
    image: AppAssets.avatar9,
    color: Colors.green,
  ),
  OnboardingData(
    title: 'Choose Your Adventure',
    description:
        'Pick from awesome categories like space, dinosaurs, fairy tales, and more!',
    image: AppAssets.avatar10,
    color: Colors.purple,
  ),
];
