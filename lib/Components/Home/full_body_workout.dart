import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Components/Home/display_workout.dart';
import 'package:fitguide_main/State_Management/Providers/workout_provider.dart';
import 'package:fitguide_main/Components/Home/workout_name.dart';

class FullBodyWorkoutsWidget extends ConsumerWidget {
  const FullBodyWorkoutsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, child) {
      final workouts = ref.watch(workoutStateProvider);
      return Column(children: [
        WorkoutNameComponent(
            workoutName: "Full Body Workouts", workouts: workouts),
        DisplayWorkoutComponent(workouts: workouts),
      ]);
    });
  }
}
