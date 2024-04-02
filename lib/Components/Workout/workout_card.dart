import 'package:flutter/material.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:fitguide_main/Components/Workout/workout_details.dart';
import 'package:fitguide_main/Components/Exercise/exercise_details.dart';
import 'package:fitguide_main/Services/api/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Components/Workout/create_update_workout.dart';

class WorkoutCardWidget extends ConsumerWidget {
  final Workout workout;
  final bool custom;
  final bool isEdit;

  const WorkoutCardWidget({
    super.key,
    required this.workout,
    required this.isEdit,
    required this.custom,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.read(userStateProvider);
    return GestureDetector(
      onTap: () {
        // Add the navigation logic or any action you want
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutDetailsView(workout: workout),
          ),
        );
      },
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16.0)),
                  child: Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${API.baseUrl}/${workout.image}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                if (isEdit)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CreateUpdateWorkoutView(workout: workout),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit, color: Colors.white),
                        ),
                        // if (custom)
                        // IconButton(
                        //   onPressed: () async {
                        //     await post_service.deleteWorkout(
                        //       context: context,
                        //       ref: ref,
                        //       userId: user.id,
                        //       workoutId: workout.id,
                        //     );
                        //   },
                        //   icon: const Icon(Icons.delete, color: Colors.white),
                        // ),
                      ],
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    workout.description,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              title: const Text(
                "Exercises",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                // List of exercises for the workout
                for (var exercise in workout.exercises)
                  ListTile(
                    title: Text(
                      exercise.name,
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    // Additional exercise details can be added here
                    trailing: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ExerciseDetailsView(exercise: exercise),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.info_outline,
                        color:
                            Colors.blue, // Set the color to your desired color
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
