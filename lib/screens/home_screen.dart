import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:podstream/screens/onboarding_screen.dart';
import 'package:podstream/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'HomeScreen',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 20),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 20),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music, size: 20),
            label: 'Library',
          ),
        ],
      ),
      body: const CustomScrollView(
        slivers: [AppSpacer(height: 12), TrendingList()],
      ),
    );
  }
}

class TrendingList extends StatefulWidget {
  const TrendingList({super.key});

  @override
  State<TrendingList> createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList>
    with SingleTickerProviderStateMixin {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Trending podcasts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 20),
          CarouselSlider(
            carouselController: carouselController,
            items: List.generate(3, (_) => const TrendingItem()),
            options: CarouselOptions(
              height: 200,
              aspectRatio: .8,
              viewportFraction: 1,
              scrollPhysics: const BouncingScrollPhysics(),
              enlargeCenterPage: true,
              clipBehavior: Clip.none,
              onPageChanged: (index, _) => setState(() => _activePage = index),
            ),
          ),
          const SizedBox(height: 18),
          OnboardingDots(
            carouselController: carouselController,
            activePage: _activePage,
          ),
        ],
      ),
    );
  }
}

class TrendingItem extends StatelessWidget {
  const TrendingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFD7F0E3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Creative Chronicles:\nArtist's Journey",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Diana Rose',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow, size: 20),
                  label: const Text('38 min'),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 24,
          bottom: 0,
          child: Image.asset(
            'assets/avatar8.png',
            height: 240,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
