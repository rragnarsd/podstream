import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/local_data/profile_data.dart';
import 'package:podstream/utils/pod_assets.dart';
import 'package:podstream/widgets/spacers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            iconTheme: const IconThemeData(color: Colors.black),
            actions: [
              IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
            ],
            flexibleSpace: const ProfileSpaceBar(),
          ),
          SliverList.separated(
            itemCount: profileData.length,
            itemBuilder: (context, index) {
              final item = profileData[index];
              return ProfileListItem(item: item);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 1,
                indent: 16,
                endIndent: 16,
                thickness: 2,
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProfileSpaceBar extends StatelessWidget {
  const ProfileSpaceBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        padding: const EdgeInsets.only(top: 80),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(AppAssets.avatar1),
            ),
            const AppSpacer(height: 10),
            const Text(
              'Bruce Wayne',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const AppSpacer(height: 4),
            const Text(
              'bruce.wayne@example.com',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const AppSpacer(height: 12),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 3),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              onPressed: () => context.push('/premium'),
              child: const Text(
                'Get Premium',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({super.key, required this.item});

  final ProfileData item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item.icon,
      title: Text(
        item.title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
