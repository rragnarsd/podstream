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
    image: 'assets/avatar1.jpg',
    podcastHost: 'Sarah Chen',
    podcastDescription:
        'Bite-sized tech news and trends in 30 minutes or less.',
    podcastTime: '45:30',
  ),
  SubscribeAuthorData(
    podCastName: 'ZenCast',
    podCastQty: '100',
    image: 'assets/avatar2.jpg',
    podcastHost: 'Dr. Michael Roberts',
    podcastDescription: 'Quick mindfulness breaks for your busy day.',
    podcastTime: '32:15',
  ),
  SubscribeAuthorData(
    podCastName: 'FlavorLab',
    podCastQty: '160',
    image: 'assets/avatar3.jpg',
    podcastHost: 'Chef Maria Gonzalez',
    podcastDescription: 'Global flavors, simple recipes, big taste.',
    podcastTime: '58:45',
  ),
  SubscribeAuthorData(
    podCastName: 'SciFi',
    podCastQty: '1000',
    image: 'assets/avatar4.jpg',
    podcastHost: 'Prof. James Wilson',
    podcastDescription: 'Science made simple, one discovery at a time.',
    podcastTime: '52:20',
  ),
  SubscribeAuthorData(
    podCastName: 'BizBoost',
    podCastQty: '10000',
    image: 'assets/avatar5.jpg',
    podcastHost: 'Alex Thompson',
    podcastDescription: 'Smart business tips in 15 minutes or less.',
    podcastTime: '49:10',
  ),
  SubscribeAuthorData(
    podCastName: 'TimeCapsule',
    podCastQty: '90',
    image: 'assets/avatar6.jpg',
    podcastHost: 'Dr. Emily Parker',
    podcastDescription: 'History\'s greatest stories, told in minutes.',
    podcastTime: '55:40',
  ),
  SubscribeAuthorData(
    podCastName: 'FitCast',
    podCastQty: '100',
    image: 'assets/avatar7.jpg',
    podcastHost: 'Coach David Miller',
    podcastDescription: 'Quick workouts, lasting results.',
    podcastTime: '38:25',
  ),
  SubscribeAuthorData(
    podCastName: 'ArtFlow',
    podCastQty: '100',
    image: 'assets/avatar2.jpg',
    podcastHost: 'Lisa Chen',
    podcastDescription: 'Creative sparks for your daily inspiration.',
    podcastTime: '43:50',
  ),
];
