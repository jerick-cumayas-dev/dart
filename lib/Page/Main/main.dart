import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Page/Home/home.dart';
import 'package:fitguide_main/State_Management/Providers/main_page_provider.dart';
import 'package:fitguide_main/Components/Navigation/bottom_navigation.dart';
import 'package:fitguide_main/Page/Library/library.dart';
import 'package:fitguide_main/Page/Statistics/statistics.dart';

class MainView extends StatelessWidget {
  MainView({super.key});
  final List<Widget> _pages = [const HomeView(), const LibraryView(), const StatisticsPage()];
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final currentPage = ref.watch(mainPageStateProvider);
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading:
              false, // Wrap UserDetailsWidget with Expanded
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Handle settings button tap
                // You can navigate to the settings screen or show a settings dialog here
              },
            ),
          ],
        ),
        body: PageView(
          onPageChanged: (index) {
            ref.read(mainPageStateProvider.notifier).updateMainPage(index);
          },
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBarComponent(
          selectedPage: currentPage,
          onTabTapped: (index) {
            ref.read(mainPageStateProvider.notifier).updateMainPage(index);
            // _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.linear);
            _pageController.jumpToPage(index);
          },
        ),
      );
    });
  }
}
