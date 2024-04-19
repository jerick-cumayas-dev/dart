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
          icon: Icon(Icons.home, color: Colors.black),
          label: 'Home',
          backgroundColor: Colors.transparent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books, color: Colors.black),
          label: 'Library',
          backgroundColor: Colors.transparent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assessment, color: Colors.black),
          label: 'Statistics',
          backgroundColor: Colors.transparent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, color: Colors.black),
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
