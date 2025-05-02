import 'package:flutter/material.dart';
import 'package:podstream/utils/constants/pod_colors.dart';

class ProfileData {
  final String title;
  final Icon icon;

  ProfileData({required this.title, required this.icon});
}

List<ProfileData> profileData = [
  ProfileData(
    title: 'My Favorites',
    icon: const Icon(Icons.favorite, color: PodColors.favoriteRed),
  ),
  ProfileData(
    title: 'My Playlists',
    icon: const Icon(Icons.playlist_play, color: PodColors.playlistBlue),
  ),
  ProfileData(
    title: 'My Stickers',
    icon: const Icon(Icons.stars, color: PodColors.stickerPurple),
  ),
  ProfileData(
    title: 'My Learning Goals',
    icon: const Icon(Icons.school, color: PodColors.learningIndigo),
  ),
  ProfileData(
    title: 'My Story Collection',
    icon: const Icon(Icons.book, color: PodColors.storyBrown),
  ),
  ProfileData(
    title: 'My Listening History',
    icon: const Icon(Icons.history, color: PodColors.historyTeal),
  ),
  ProfileData(
    title: 'My Settings',
    icon: const Icon(Icons.settings, color: PodColors.settingsBlueGrey),
  ),
];
