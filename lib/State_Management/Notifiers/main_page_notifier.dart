import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPageStateNotifier extends StateNotifier<int> {
  MainPageStateNotifier(super.state);

  void updateMainPage(int page) {
    state = page;
  }
}
