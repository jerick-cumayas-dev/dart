import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Models/user.dart';
import 'package:fitguide_main/State_Management/Notifiers/user_notifier.dart';

final userStateProvider = StateNotifierProvider<UserStateNotifier, User>((ref) {
  return UserStateNotifier(
    User(
      id: 0,
      email: '',
      firstName: '',
      lastName: '',
      profilePicture: '',
      dateJoined: '',
      lastLogin: '',
    ),
  );
});