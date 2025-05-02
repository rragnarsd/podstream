import 'package:podstream/utils/constants/pod_assets.dart';

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
    podCastName: 'Story Time',
    podCastQty: '25 Podcasts',
    image: AppAssets.avatar1,
    podcastHost: 'Miss Sarah',
    podcastDescription:
        'Join Miss Sarah for magical bedtime stories that will take you to wonderful worlds!',
    podcastTime: '15-20 min',
  ),
  SubscribeAuthorData(
    podCastName: 'Science Explorers',
    podCastQty: '18 Podcasts',
    image: AppAssets.avatar2,
    podcastHost: 'Dr. Brain',
    podcastDescription:
        'Fun science experiments and cool facts that will make you go "Wow!"',
    podcastTime: '20-25 min',
  ),
  SubscribeAuthorData(
    podCastName: 'Adventure Time',
    podCastQty: '30 Podcasts',
    image: AppAssets.avatar3,
    podcastHost: 'Captain Jack',
    podcastDescription:
        'Exciting adventures with Captain Jack and his crew of young explorers!',
    podcastTime: '25-30 min',
  ),
  SubscribeAuthorData(
    podCastName: 'Music Makers',
    podCastQty: '15 Podcasts',
    image: AppAssets.avatar4,
    podcastHost: 'Melody',
    podcastDescription:
        'Learn about music, sing along, and discover different instruments!',
    podcastTime: '15-20 min',
  ),
  SubscribeAuthorData(
    podCastName: 'Space Explorers',
    podCastQty: '12 Podcasts',
    image: AppAssets.avatar5,
    podcastHost: 'Astro Annie',
    podcastDescription:
        'Journey through space and learn about planets, stars, and galaxies!',
    podcastTime: '20-25 min',
  ),
  SubscribeAuthorData(
    podCastName: 'Animal Friends',
    podCastQty: '20 Podcasts',
    image: AppAssets.avatar6,
    podcastHost: 'Zoo Keeper Zoe',
    podcastDescription:
        'Meet amazing animals and learn fun facts about creatures big and small!',
    podcastTime: '15-20 min',
  ),
  SubscribeAuthorData(
    podCastName: 'Art Adventures',
    podCastQty: '16 Podcasts',
    image: AppAssets.avatar7,
    podcastHost: 'Artie',
    podcastDescription:
        'Creative art projects and fun drawing activities for young artists!',
    podcastTime: '15-20 min',
  ),
  SubscribeAuthorData(
    podCastName: 'Superhero Stories',
    podCastQty: '22 Podcasts',
    image: AppAssets.avatar8,
    podcastHost: 'Captain Courage',
    podcastDescription:
        'Exciting stories about everyday heroes and their amazing adventures!',
    podcastTime: '20-25 min',
  ),
  SubscribeAuthorData(
    podCastName: 'Dinosaur Discoveries',
    podCastQty: '10 Podcasts',
    image: AppAssets.avatar9,
    podcastHost: 'Dino Dan',
    podcastDescription:
        'Travel back in time to meet dinosaurs and learn about prehistoric life!',
    podcastTime: '20-25 min',
  ),
  SubscribeAuthorData(
    podCastName: 'Funny Tales',
    podCastQty: '28 Podcasts',
    image: AppAssets.avatar10,
    podcastHost: 'Giggles',
    podcastDescription:
        'Laugh-out-loud stories and jokes that will make your day brighter!',
    podcastTime: '15-20 min',
  ),
];
