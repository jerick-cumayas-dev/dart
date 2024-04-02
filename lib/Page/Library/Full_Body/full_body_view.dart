import 'package:flutter/material.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:fitguide_main/Components/Workout/workout_card.dart';

class FullBodyWorkoutListView extends StatelessWidget {
  final List<Workout> workouts;

  const FullBodyWorkoutListView({
    super.key,
    required this.workouts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ...workouts.map((workout) {
              return WorkoutCardWidget(
                workout: workout,
                isEdit: false,
                custom: false,
              );
            }),
          ],
        ),
      ),
    );
  }
}
