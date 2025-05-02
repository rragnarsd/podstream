import 'package:flutter/material.dart';
import 'package:podstream/utils/constants/pod_colors.dart';

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
    color: PodColors.orangePeach,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Science',
    isSelected: false,
    color: PodColors.lightYellowGreen,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Fairy Tales',
    isSelected: false,
    color: PodColors.lavenderCream,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Sports',
    isSelected: false,
    color: PodColors.softPeach,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'School & Learning',
    isSelected: false,
    color: PodColors.paleApricot,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Animals',
    isSelected: false,
    color: PodColors.lightSkyBlue,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Bedtime Stories',
    isSelected: false,
    color: PodColors.softMauve,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Art & Creativity',
    isSelected: false,
    color: PodColors.lightPink,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Music & Songs',
    isSelected: false,
    color: PodColors.aquaMint,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Funny Stories',
    isSelected: false,
    color: PodColors.brightSunshine,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Space & Planets',
    isSelected: false,
    color: PodColors.mintCream,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Dinosaurs',
    isSelected: false,
    color: PodColors.peachBlush,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Superheroes',
    isSelected: false,
    color: PodColors.paleLavender,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Friendship',
    isSelected: false,
    color: PodColors.lightBlueSky,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Games & Puzzles',
    isSelected: false,
    color: PodColors.mintLeaf,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Magic & Fantasy',
    isSelected: false,
    color: PodColors.paleLemon,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Cooking for Kids',
    isSelected: false,
    color: PodColors.creamLight,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Myths & Legends',
    isSelected: false,
    color: PodColors.blushRose,
    textColor: PodColors.textColor,
  ),
  InterestData(
    interest: 'Growing Up',
    isSelected: false,
    color: PodColors.warmAmber,
    textColor: PodColors.textColor,
  ),
];
