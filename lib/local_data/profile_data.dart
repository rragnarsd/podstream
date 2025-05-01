import 'package:flutter/material.dart';

class ProfileData {
  final String title;
  final Icon icon;

  ProfileData({required this.title, required this.icon});
}

List<ProfileData> profileData = [
  ProfileData(
    title: 'My Favorites',
    icon: const Icon(Icons.favorite, color: Colors.pink),
  ),
  ProfileData(
    title: 'My Playlists',
    icon: const Icon(Icons.playlist_play, color: Colors.blue),
  ),
  ProfileData(
    title: 'My Stickers',
    icon: const Icon(Icons.stars, color: Colors.purple),
  ),
  ProfileData(
    title: 'My Learning Goals',
    icon: const Icon(Icons.school, color: Colors.indigo),
  ),
  ProfileData(
    title: 'My Story Collection',
    icon: const Icon(Icons.book, color: Colors.brown),
  ),
  ProfileData(
    title: 'My Listening History',
    icon: const Icon(Icons.history, color: Colors.teal),
  ),
  ProfileData(
    title: 'My Settings',
    icon: const Icon(Icons.settings, color: Colors.grey),
  ),
];
