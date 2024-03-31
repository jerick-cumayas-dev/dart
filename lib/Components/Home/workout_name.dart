import 'package:flutter/material.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:fitguide_main/Components/Workout/all_workout_details.dart';

class WorkoutNameComponent extends StatelessWidget {
  final String workoutName;
  final List<Workout> workouts;

  const WorkoutNameComponent({
    super.key,
    required this.workoutName,
    required this.workouts,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.0,
            ),
            children: [
              TextSpan(
                text: workoutName.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AllWorkoutDetailsView(workouts: workouts),
                ),
              );
            },
            child: const Text("See All"),
          ),
        )
      ],
    );
  }
}
