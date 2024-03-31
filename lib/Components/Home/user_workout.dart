import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Components/Home/workout_name.dart';
import 'package:fitguide_main/State_Management/Providers/user_workout_provider.dart';
import 'package:fitguide_main/Components/Home/display_workout.dart';

class UserWorkoutsWidget extends ConsumerWidget {
  const UserWorkoutsWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, child) {
      final workouts = ref.watch(userWorkoutStateProvider);
      return Column(children: [
        WorkoutNameComponent(
            workoutName: "Custom Workouts", workouts: workouts),
        DisplayWorkoutComponent(workouts: workouts),
      ]);
    });
  }
}
