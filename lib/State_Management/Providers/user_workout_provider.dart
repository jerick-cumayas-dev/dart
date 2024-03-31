import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:fitguide_main/State_Management/Notifiers/user_workout_notifier.dart';

final userWorkoutStateProvider =
    StateNotifierProvider<UserWorkoutStateNotifier, List<Workout>>((ref) {
  return UserWorkoutStateNotifier([]);
});
