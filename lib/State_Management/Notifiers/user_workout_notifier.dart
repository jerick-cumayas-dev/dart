import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Models/workout.dart';

class UserWorkoutStateNotifier extends StateNotifier<List<Workout>> {
  UserWorkoutStateNotifier(super.state);

  void setWorkouts(List<Workout> workouts) {
    state = workouts;
  }

  void resetState() {
    state = [];
  }
}
