import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/State_Management/Notifiers/main_page_notifier.dart';

final mainPageStateProvider =
    StateNotifierProvider<MainPageStateNotifier, int>((ref) {
  return MainPageStateNotifier(0);
});
