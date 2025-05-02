import 'package:flutter/material.dart';
import 'package:podstream/utils/constants/pod_assets.dart';
import 'package:podstream/utils/constants/pod_colors.dart';

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
    image: AppAssets.avatar11,
    backgroundColor: PodColors.mintLeaf,
  ),
  const TrendingPodcast(
    title: 'Dinosaur Discoveries',
    host: 'Dino Dan',
    duration: '25 min',
    image: AppAssets.avatar12,
    backgroundColor: PodColors.lavenderCream,
  ),
  const TrendingPodcast(
    title: 'Funny Tales',
    host: 'Giggles',
    duration: '16 min',
    image: AppAssets.avatar13,
    backgroundColor: PodColors.paleApricot,
  ),
];
