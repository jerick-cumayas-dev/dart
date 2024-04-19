import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/State_Management/Providers/user_workout_provider.dart';
import 'package:fitguide_main/State_Management/Providers/workout_provider.dart';
import 'package:fitguide_main/State_Management/Providers/exercise_provider.dart';
import 'package:fitguide_main/Page/Library/Full_Body/full_body_view.dart';
import 'package:fitguide_main/Page/Library/Workout/workout_list.dart';
import 'package:fitguide_main/Page/Library/Exercise/exercise.dart';

class LibraryView extends StatefulWidget {
  final int? tabLocation;

  const LibraryView({
    super.key,
    this.tabLocation,
  });

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Set the initial tab if tabLocation is provided
    if (widget.tabLocation != null) {
      _tabController.index = widget.tabLocation!;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TabBar(
        controller: _tabController,
        tabs: const [
          Tab(
            text: 'Full Body Workout',
            icon: Icon(Icons.accessibility, color: Colors.black),
          ),
          Tab(
            text: 'Custom Body Workout',
            icon: Icon(Icons.favorite, color: Colors.black),
          ),
          Tab(
            text: 'Exercises',
            icon: Icon(Icons.fitness_center, color: Colors.black),
          ),
        ],
        indicatorColor: Colors.black,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
      ),
      Expanded(
        child: Consumer(
          builder: (context, ref, child) {
            final workouts = ref.watch(workoutStateProvider);
            final userWorkouts = ref.watch(userWorkoutStateProvider);
            final exercises = ref.watch(exerciseStateProvider);

            return TabBarView(
              controller: _tabController,
              children: [
                FullBodyWorkoutListView(workouts: workouts),
                WorkoutListView(workouts: userWorkouts),
                ExercisesPage(exercises: exercises),
              ],
            );
          },
        ),
      ),
    ]);
  }
}
