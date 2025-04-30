import 'package:flutter/material.dart';

class ProfileData {
  final String title;
  final Icon icon;

  ProfileData({required this.title, required this.icon});
}

List<ProfileData> profileData = [
  ProfileData(title: 'Edit Profile', icon: const Icon(Icons.person_outline)),
  ProfileData(
    title: 'Notification',
    icon: const Icon(Icons.notifications_outlined),
  ),
  ProfileData(title: 'Downloads', icon: const Icon(Icons.download_outlined)),
  ProfileData(title: 'Security', icon: const Icon(Icons.security_outlined)),
  ProfileData(
    title: 'Language & Region',
    icon: const Icon(Icons.language_outlined),
  ),
  ProfileData(title: 'Help Center', icon: const Icon(Icons.help_outline)),
];
