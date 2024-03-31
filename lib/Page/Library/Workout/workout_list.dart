import 'package:flutter/material.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:fitguide_main/Components/Workout/workout_card.dart';
import 'package:fitguide_main/Components/Workout/create_update_workout.dart';

class WorkoutListView extends StatefulWidget {
  final List<Workout> workouts;

  const WorkoutListView({
    super.key,
    required this.workouts,
  });

  @override
  State<WorkoutListView> createState() => _WorkoutListView();
}

class _WorkoutListView extends State<WorkoutListView> {
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isEdit = !isEdit;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.purple,
                  backgroundColor: Colors.white,
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.006),
                      Text(
                        "Edit Workout",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ...widget.workouts.map((workout) {
                return WorkoutCardWidget(
                    workout: workout, isEdit: isEdit, custom: false);
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateUpdateWorkoutView(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
