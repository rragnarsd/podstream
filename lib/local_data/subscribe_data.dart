import 'package:podstream/utils/pod_assets.dart';

class SubscribeAuthorData {
  final String podCastName;
  final String podCastQty;
  final String image;
  final String? podcastHost;
  final String? podcastDescription;
  final String? podcastTime;

  SubscribeAuthorData({
    required this.podCastName,
    required this.podCastQty,
    required this.image,
    this.podcastHost,
    this.podcastDescription,
    this.podcastTime,
  });
}

List<SubscribeAuthorData> subscribeAuthorData = [
  SubscribeAuthorData(
    podCastName: 'TechBytes',
    podCastQty: '10',
    image: AppAssets.avatar1,
    podcastHost: 'Sarah Chen',
    podcastDescription:
        'Bite-sized tech news and trends in 30 minutes or less.',
    podcastTime: '45:30',
  ),
  SubscribeAuthorData(
    podCastName: 'ZenCast',
    podCastQty: '100',
    image: AppAssets.avatar2,
    podcastHost: 'Dr. Michael Roberts',
    podcastDescription: 'Quick mindfulness breaks for your busy day.',
    podcastTime: '32:15',
  ),
  SubscribeAuthorData(
    podCastName: 'FlavorLab',
    podCastQty: '160',
    image: AppAssets.avatar3,
    podcastHost: 'Chef Maria Gonzalez',
    podcastDescription: 'Global flavors, simple recipes, big taste.',
    podcastTime: '58:45',
  ),
  SubscribeAuthorData(
    podCastName: 'SciFi',
    podCastQty: '1000',
    image: AppAssets.avatar4,
    podcastHost: 'Prof. James Wilson',
    podcastDescription: 'Science made simple, one discovery at a time.',
    podcastTime: '52:20',
  ),
  SubscribeAuthorData(
    podCastName: 'BizBoost',
    podCastQty: '10000',
    image: AppAssets.avatar5,
    podcastHost: 'Alex Thompson',
    podcastDescription: 'Smart business tips in 15 minutes or less.',
    podcastTime: '49:10',
  ),
  SubscribeAuthorData(
    podCastName: 'TimeCapsule',
    podCastQty: '90',
    image: AppAssets.avatar6,
    podcastHost: 'Dr. Emily Parker',
    podcastDescription: 'History\'s greatest stories, told in minutes.',
    podcastTime: '55:40',
  ),
  SubscribeAuthorData(
    podCastName: 'FitCast',
    podCastQty: '100',
    image: AppAssets.avatar7,
    podcastHost: 'Coach David Miller',
    podcastDescription: 'Quick workouts, lasting results.',
    podcastTime: '38:25',
  ),
  SubscribeAuthorData(
    podCastName: 'ArtFlow',
    podCastQty: '100',
    image: AppAssets.avatar2,
    podcastHost: 'Lisa Chen',
    podcastDescription: 'Creative sparks for your daily inspiration.',
    podcastTime: '43:50',
  ),
];
