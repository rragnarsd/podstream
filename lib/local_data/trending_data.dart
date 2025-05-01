import 'package:flutter/material.dart';
import 'package:podstream/utils/pod_assets.dart';

class TrendingPodcast {
  final String title;
  final String host;
  final String duration;
  final String image;
  final Color backgroundColor;

  const TrendingPodcast({
    required this.title,
    required this.host,
    required this.duration,
    required this.image,
    required this.backgroundColor,
  });
}

final List<TrendingPodcast> trendingPodcasts = [
  const TrendingPodcast(
    title: 'Superhero Stories',
    host: 'Captain Courage',
    duration: '20 min',
    image: AppAssets.avatar8,
    backgroundColor: Color(0xFFD7F0E3),
  ),
  const TrendingPodcast(
    title: 'Dinosaur Discoveries',
    host: 'Dino Dan',
    duration: '25 min',
    image: AppAssets.avatar8,
    backgroundColor: Color(0xFFFFE4E1),
  ),
  const TrendingPodcast(
    title: 'Funny Tales',
    host: 'Giggles',
    duration: '16 min',
    image: AppAssets.avatar8,
    backgroundColor: Color(0xFFE6E6FA),
  ),
];
