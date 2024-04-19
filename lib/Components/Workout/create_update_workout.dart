import 'package:flutter/material.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Models/exercise.dart';
import 'package:fitguide_main/State_Management/Providers/exercise_provider.dart';
import 'package:fitguide_main/Services/user_workouts_service.dart';

class CreateUpdateWorkoutView extends StatefulWidget {
  final Workout? workout;

  const CreateUpdateWorkoutView({super.key, this.workout});

  @override
  _CreateUpdateWorkoutViewState createState() =>
      _CreateUpdateWorkoutViewState();
}

class _CreateUpdateWorkoutViewState extends State<CreateUpdateWorkoutView> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late List<int> selectedExercises;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.workout?.name ?? '');
    descriptionController =
        TextEditingController(text: widget.workout?.description ?? '');
    selectedExercises = List<int>.from(
      widget.workout?.exercises.map((exercise) => exercise.id) ?? [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.workout == null ? 'Create Workout' : 'Update Workout'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final exercises = ref.watch(exerciseStateProvider);
          return Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Workout Name'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descriptionController,
                  decoration:
                      const InputDecoration(labelText: 'Workout Description'),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                const Text('Select Exercises:'),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      Exercise exercise = exercises[index];
                      return ListTile(
                        title: Text(exercise.name),
                        trailing: Checkbox(
                          value: selectedExercises.contains(exercise.id),
                          onChanged: (value) {
                            setState(() {
                              if (value != null && value) {
                                selectedExercises.add(exercise.id);
                              } else {
                                selectedExercises.remove(exercise.id);
                              }
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    // Here you can use selectedExercises list
                    print(selectedExercises);
                    widget.workout == null
                        ? UserWorkoutService.createUserWorkout(
                            context: context,
                            ref: ref,
                            workoutName: nameController.text,
                            workoutDescription: descriptionController.text,
                            selectedExercises: selectedExercises)
                        : UserWorkoutService.updateUserWorkout(
                            context: context,
                            ref: ref,
                            workoutId: widget.workout!.id,
                            workoutName: nameController.text,
                            workoutDescription: descriptionController.text,
                            selectedExercises: selectedExercises);
                  },
                  child: Text(widget.workout == null
                      ? 'Save Workout'
                      : 'Update Workout'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
