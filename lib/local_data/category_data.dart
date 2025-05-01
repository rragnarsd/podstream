import 'package:flutter/material.dart';
import 'package:podstream/utils/pod_assets.dart';

class CategoryData {
  final String category;
  final String podcastCount;
  final Color color;
  final Color textColor;
  final String? image;

  CategoryData({
    required this.category,
    required this.podcastCount,
    required this.color,
    required this.textColor,
    this.image,
  });
}

List<CategoryData> categories = [
  CategoryData(
    category: 'Adventure',
    podcastCount: '12 Podcasts',
    color: const Color(0xFFF1BA88),
    textColor: const Color(0xFF2D2D2D),
    image: AppAssets.avatar14,
  ),
  CategoryData(
    category: 'Science',
    podcastCount: '15 Podcasts',
    color: const Color(0xFFE9F5BE),
    textColor: const Color(0xFF2D2D2D),
  ),
  CategoryData(
    category: 'Fairy Tales',
    podcastCount: '20 Podcasts',
    color: const Color(0xFFD8C3E2),
    textColor: const Color(0xFF2D2D2D),
  ),
  CategoryData(
    category: 'Sports',
    podcastCount: '8 Podcasts',
    color: const Color(0xFFF5D6C6),
    textColor: const Color(0xFF2D2D2D),
  ),
  CategoryData(
    category: 'School & Learning',
    podcastCount: '18 Podcasts',
    color: const Color(0xFFFFE0B5),
    textColor: const Color(0xFF2D2D2D),
  ),
  CategoryData(
    category: 'Animals',
    podcastCount: '14 Podcasts',
    color: const Color(0xFFC3D9F5),
    textColor: const Color(0xFF2D2D2D),
  ),
  CategoryData(
    category: 'Bedtime Stories',
    podcastCount: '25 Podcasts',
    color: const Color(0xFFD7CCC8),
    textColor: const Color(0xFF2D2D2D),
  ),
  CategoryData(
    category: 'Art & Creativity',
    podcastCount: '10 Podcasts',
    color: const Color(0xFFF8C6D8),
    textColor: const Color(0xff2d2d2d),
  ),
  CategoryData(
    category: 'Music & Songs',
    podcastCount: '16 Podcasts',
    color: const Color(0xFFBCE3DF),
    textColor: const Color(0xFF2D2D2D),
  ),
  CategoryData(
    category: 'Funny Stories',
    podcastCount: '12 Podcasts',
    color: const Color(0xFFFFE29A),
    textColor: const Color(0xff2d2d2d),
  ),
  CategoryData(
    category: 'Space & Planets',
    podcastCount: '9 Podcasts',
    color: const Color(0xFFC2E7E5),
    textColor: const Color(0xff2d2d2d),
  ),
  CategoryData(
    category: 'Dinosaurs',
    podcastCount: '7 Podcasts',
    color: const Color(0xFFF7BFA0),
    textColor: const Color(0xFF2D2D2D),
  ),
  CategoryData(
    category: 'Superheroes',
    podcastCount: '11 Podcasts',
    color: const Color(0xFFD1C4E9),
    textColor: const Color(0xFF2D2D2D),
  ),
  CategoryData(
    category: 'Friendship',
    podcastCount: '13 Podcasts',
    color: const Color(0xFFB3E5FC),
    textColor: const Color(0xff2d2d2d),
  ),
  CategoryData(
    category: 'Games & Puzzles',
    podcastCount: '8 Podcasts',
    color: const Color(0xFFC8E6C9),
    textColor: const Color(0xff2d2d2d),
  ),
  CategoryData(
    category: 'Magic & Fantasy',
    podcastCount: '15 Podcasts',
    color: const Color(0xFFF0F4C3),
    textColor: const Color(0xff2d2d2d),
  ),
  CategoryData(
    category: 'Cooking for Kids',
    podcastCount: '6 Podcasts',
    color: const Color(0xFFFFF9C4),
    textColor: const Color(0xff2d2d2d),
  ),
  CategoryData(
    category: 'Myths & Legends',
    podcastCount: '10 Podcasts',
    color: const Color(0xFFFFCDD2),
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Growing Up',
    podcastCount: '9 Podcasts',
    color: const Color(0xFFFFECB3),
    textColor: const Color(0xff2d2d2d),
  ),
  CategoryData(
    category: 'Nature & Environment',
    podcastCount: '12 Podcasts',
    color: const Color(0xFFE0F7FA),
    textColor: const Color(0xff2d2d2d),
  ),
  CategoryData(
    category: 'World Cultures',
    podcastCount: '11 Podcasts',
    color: const Color(0xFFE1BEE7),
    textColor: const Color(0xFF2D2D2D),
  ),
  CategoryData(
    category: 'Inventors & Inventions',
    podcastCount: '8 Podcasts',
    color: const Color(0xFFBBDEFB),
    textColor: const Color(0xFF2D2D2D),
  ),
  CategoryData(
    category: 'Ocean Adventures',
    podcastCount: '7 Podcasts',
    color: const Color(0xFFB2EBF2),
    textColor: const Color(0xff2d2d2d),
  ),
  CategoryData(
    category: 'Time Travel',
    podcastCount: '9 Podcasts',
    color: const Color(0xFFE1BEE7),
    textColor: const Color(0xFF2D2D2D),
  ),
];
