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
    category: 'Technology',
    podcastCount: '12',
    color: Colors.blue,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Science',
    podcastCount: '13',
    color: Colors.green,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Business',
    podcastCount: '15',
    color: Colors.purple,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Health',
    podcastCount: '11',
    color: Colors.red,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Education',
    podcastCount: '10',
    color: Colors.orange,
    textColor: Colors.black,
  ),
  CategoryData(
    category: 'Politics',
    podcastCount: '9',
    color: Colors.indigo,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'History',
    podcastCount: '8',
    color: Colors.brown,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Art',
    podcastCount: '7',
    color: Colors.pink,
    textColor: Colors.black,
  ),
  CategoryData(
    category: 'Music',
    podcastCount: '6',
    color: Colors.teal,
    textColor: Colors.white,
  ),
  CategoryData(
    category: 'Sports',
    podcastCount: '5',
    color: Colors.amber,
    textColor: Colors.black,
  ),
];
