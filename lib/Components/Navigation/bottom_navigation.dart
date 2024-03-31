import 'package:fitguide_main/State_Management/Providers/main_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationBarComponent extends ConsumerWidget {
  final int selectedPage;
  final ValueChanged<int> onTabTapped;

  const BottomNavigationBarComponent({
    super.key,
    required this.selectedPage,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 8,
              onTabChange: (index) {
                ref.watch(mainPageStateProvider.notifier).updateMainPage(index);
              },
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(icon: Icons.library_books, text: 'Library'),
                GButton(
                  icon: Icons.assessment,
                  text: 'Statistics',
                ),
                GButton(icon: Icons.account_circle, text: 'Profile')
              ]),
        ));
  }
}
