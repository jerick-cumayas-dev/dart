import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:fitguide_main/State_Management/Notifiers/workout_notifier.dart';

final workoutStateProvider =
    StateNotifierProvider<WorkoutStateNotifier, List<Workout>>((ref) {
  return WorkoutStateNotifier([]);
});
