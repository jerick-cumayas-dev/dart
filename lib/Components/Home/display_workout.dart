import 'package:flutter/material.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:fitguide_main/Services/api/api.dart';
import 'package:fitguide_main/Components/Workout/workout_details.dart';

class DisplayWorkoutComponent extends StatelessWidget {
  final List<Workout> workouts;

  const DisplayWorkoutComponent({
    super.key,
    required this.workouts,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: workouts.take(10).map((workout) {
          return Container(
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.04),
            child: buildWorkoutButton(context, workout),
          );
        }).toList(),
      ),
    );
  }

  Widget buildWorkoutButton(BuildContext context, Workout workout) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WorkoutDetailsView(workout: workout),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.transparent,
      ),
      child: Container(
        height: 130,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.3),
          image: DecorationImage(
            image: NetworkImage('${API.baseUrl}/${workout.image}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
              workout.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
