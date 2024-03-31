import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Models/workout.dart';

class WorkoutStateNotifier extends StateNotifier<List<Workout>> {
  WorkoutStateNotifier(super.initialState);

  void setWorkouts(List<Workout> workouts) {
    state = workouts;
  }

  void resetState() {
    state = [];
  }
}
