import 'package:flutter/material.dart';
import 'package:podstream/utils/constants/pod_colors.dart';

class CategoryData {
  final String category;
  final String podcastCount;
  final Color color;
  final Color textColor;

  CategoryData({
    required this.category,
    required this.podcastCount,
    required this.color,
    required this.textColor,
  });
}

List<CategoryData> categories = [
  CategoryData(
    category: 'Adventure',
    podcastCount: '12 Podcasts',
    color: PodColors.orangePeach,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Science',
    podcastCount: '15 Podcasts',
    color: PodColors.lightYellowGreen,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Fairy Tales',
    podcastCount: '20 Podcasts',
    color: PodColors.lavenderCream,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Sports',
    podcastCount: '8 Podcasts',
    color: PodColors.softPeach,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'School & Learning',
    podcastCount: '18 Podcasts',
    color: PodColors.paleApricot,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Animals',
    podcastCount: '14 Podcasts',
    color: PodColors.lightSkyBlue,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Bedtime Stories',
    podcastCount: '25 Podcasts',
    color: PodColors.softMauve,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Art & Creativity',
    podcastCount: '10 Podcasts',
    color: PodColors.lightPink,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Music & Songs',
    podcastCount: '16 Podcasts',
    color: PodColors.aquaMint,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Funny Stories',
    podcastCount: '12 Podcasts',
    color: PodColors.brightSunshine,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Space & Planets',
    podcastCount: '9 Podcasts',
    color: PodColors.mintCream,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Dinosaurs',
    podcastCount: '7 Podcasts',
    color: PodColors.peachBlush,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Superheroes',
    podcastCount: '11 Podcasts',
    color: PodColors.paleLavender,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Friendship',
    podcastCount: '13 Podcasts',
    color: PodColors.lightBlueSky,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Games & Puzzles',
    podcastCount: '8 Podcasts',
    color: PodColors.mintLeaf,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Magic & Fantasy',
    podcastCount: '15 Podcasts',
    color: PodColors.paleLemon,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Cooking for Kids',
    podcastCount: '6 Podcasts',
    color: PodColors.creamLight,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Myths & Legends',
    podcastCount: '10 Podcasts',
    color: PodColors.blushRose,
    textColor: PodColors.whiteColor,
  ),
  CategoryData(
    category: 'Growing Up',
    podcastCount: '9 Podcasts',
    color: PodColors.warmAmber,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Nature & Environment',
    podcastCount: '12 Podcasts',
    color: PodColors.iceBlue,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'World Cultures',
    podcastCount: '11 Podcasts',
    color: PodColors.pastelViolet,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Inventors & Inventions',
    podcastCount: '8 Podcasts',
    color: PodColors.softBlue,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Ocean Adventures',
    podcastCount: '7 Podcasts',
    color: PodColors.oceanMist,
    textColor: PodColors.textColor,
  ),
  CategoryData(
    category: 'Time Travel',
    podcastCount: '9 Podcasts',
    color: PodColors.pastelViolet,
    textColor: PodColors.textColor,
  ),
];
