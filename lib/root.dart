import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/utils/constants/pod_assets.dart';

enum TabItem { home, search, profile }

class Root extends StatefulWidget {
  const Root({super.key, required this.child});

  final Widget child;

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  TabItem _selectedTab = TabItem.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedFontSize: 14,
        currentIndex: _selectedTab.index,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 20),
            activeIcon: Icon(Icons.home, size: 20),
            label: AppAssets.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined, size: 20),
            activeIcon: Icon(Icons.search, size: 20),
            label: AppAssets.search,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined, size: 20),
            activeIcon: Icon(Icons.person, size: 20),
            label: AppAssets.profile,
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    final selected = TabItem.values[index];

    setState(() => _selectedTab = selected);

    final route = switch (selected) {
      TabItem.home => '/',
      TabItem.search => '/search',
      TabItem.profile => '/profile',
    };

    context.go(route);
  }
}
