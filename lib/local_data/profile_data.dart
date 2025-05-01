import 'package:flutter/material.dart';

class ProfileData {
  final String title;
  final Icon icon;

  ProfileData({required this.title, required this.icon});
}

List<ProfileData> profileData = [
  ProfileData(
    title: 'My Favorites',
    icon: const Icon(Icons.favorite, color: Color(0xFFE57373)),
  ),
  ProfileData(
    title: 'My Playlists',
    icon: const Icon(Icons.playlist_play, color: Color(0xFF64B5F6)),
  ),
  ProfileData(
    title: 'My Stickers',
    icon: const Icon(Icons.stars, color: Color(0xFFBA68C8)),
  ),
  ProfileData(
    title: 'My Learning Goals',
    icon: const Icon(Icons.school, color: Color(0xFF7986CB)),
  ),
  ProfileData(
    title: 'My Story Collection',
    icon: const Icon(Icons.book, color: Color(0xFFA1887F)),
  ),
  ProfileData(
    title: 'My Listening History',
    icon: const Icon(Icons.history, color: Color(0xFF4DB6AC)),
  ),
  ProfileData(
    title: 'My Settings',
    icon: const Icon(Icons.settings, color: Color(0xFF90A4AE)),
  ),
];
