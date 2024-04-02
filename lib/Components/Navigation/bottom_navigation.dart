import 'package:flutter/material.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  final int selectedPage;
  final ValueChanged<int> onTabTapped;

  const BottomNavigationBarComponent({
    super.key,
    required this.selectedPage,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white),
          label: 'Home',
          backgroundColor: Colors.transparent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books, color: Colors.white),
          label: 'Library',
          backgroundColor: Colors.transparent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assessment, color: Colors.white),
          label: 'Statistics',
          backgroundColor: Colors.transparent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, color: Colors.white),
          label: 'Profile',
          backgroundColor: Colors.transparent,
        ),
      ],
      currentIndex: selectedPage,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      onTap: onTabTapped,
    );
  }
}
