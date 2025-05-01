import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/screens/search_screen.dart';
import 'package:podstream/widgets/spacers.dart';
import 'package:podstream/widgets/text_headers.dart';

class PodcastScreen extends StatelessWidget {
  const PodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              color: const Color(0xFF2D2D2D),
              onPressed: () => context.pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share, size: 26),
                color: const Color(0xFF2D2D2D),
                onPressed: () => context.push('/premium'),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton.outlined(
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
                    onPressed: () {},
                    icon: const Row(
                      children: [
                        Icon(Icons.person_add_alt, color: Colors.black),
                        AppSpacer(width: 8),
                        Text(
                          'Follow',
                          style: TextStyle(
                            color: Color(0xFF2D2D2D),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverAppTextHeader(title: 'All Episodes'),
          const SliverAppSpacer(height: 8),
          //TODO - Add corresponding podcast list with a specific host
          const PodcastList(),
        ],
      ),
    );
  }
}
