import 'package:flutter/material.dart';

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
    color: Colors.blue,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Science',
    podcastCount: '15 Podcasts',
    color: Colors.green,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Fairy Tales',
    podcastCount: '20 Podcasts',
    color: Colors.purple,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Sports',
    podcastCount: '8 Podcasts',
    color: Colors.red,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'School & Learning',
    podcastCount: '18 Podcasts',
    color: Colors.orange,
    textColor: Colors.black,
  ),
  CategoryData(
    category: 'Animals',
    podcastCount: '14 Podcasts',
    color: Colors.indigo,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Bedtime Stories',
    podcastCount: '25 Podcasts',
    color: Colors.brown,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Art & Creativity',
    podcastCount: '10 Podcasts',
    color: Colors.pink,
    textColor: Colors.black,
  ),
  CategoryData(
    category: 'Music & Songs',
    podcastCount: '16 Podcasts',
    color: Colors.teal,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Funny Stories',
    podcastCount: '12 Podcasts',
    color: Colors.amber,
    textColor: Colors.black,
  ),
  CategoryData(
    category: 'Space & Planets',
    podcastCount: '9 Podcasts',
    color: Colors.cyan,
    textColor: Colors.black,
  ),
  CategoryData(
    category: 'Dinosaurs',
    podcastCount: '7 Podcasts',
    color: Colors.deepOrange,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Superheroes',
    podcastCount: '11 Podcasts',
    color: Colors.deepPurple,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Friendship',
    podcastCount: '13 Podcasts',
    color: Colors.lightBlue,
    textColor: Colors.black,
  ),
  CategoryData(
    category: 'Games & Puzzles',
    podcastCount: '8 Podcasts',
    color: Colors.lightGreen,
    textColor: Colors.black,
  ),
  CategoryData(
    category: 'Magic & Fantasy',
    podcastCount: '15 Podcasts',
    color: Colors.lime,
    textColor: Colors.black,
  ),
  CategoryData(
    category: 'Cooking for Kids',
    podcastCount: '6 Podcasts',
    color: Colors.yellow,
    textColor: Colors.black,
  ),
  CategoryData(
    category: 'Myths & Legends',
    podcastCount: '10 Podcasts',
    color: Colors.redAccent,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Growing Up',
    podcastCount: '9 Podcasts',
    color: Colors.amberAccent,
    textColor: Colors.black,
  ),
  CategoryData(
    category: 'Nature & Environment',
    podcastCount: '12 Podcasts',
    color: Colors.lightGreenAccent,
    textColor: Colors.black,
  ),
  CategoryData(
    category: 'World Cultures',
    podcastCount: '11 Podcasts',
    color: Colors.deepPurpleAccent,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Inventors & Inventions',
    podcastCount: '8 Podcasts',
    color: Colors.blueAccent,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Ocean Adventures',
    podcastCount: '7 Podcasts',
    color: Colors.cyanAccent,
    textColor: Colors.black,
  ),
  CategoryData(
    category: 'Time Travel',
    podcastCount: '9 Podcasts',
    color: Colors.purpleAccent,
    textColor: Colors.white,
  ),
];
