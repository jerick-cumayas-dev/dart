import 'package:fitguide_main/Models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserStateNotifier extends StateNotifier<User> {
  UserStateNotifier(super.state);

  void setUser(User newUser) {
    state = newUser;
  }

  void resetState() {
    state = User(
      id: 0,
      email: '',
      firstName: '',
      lastName: '',
      profilePicture: '',
      dateJoined: '',
      lastLogin: '',
    );
  }
}