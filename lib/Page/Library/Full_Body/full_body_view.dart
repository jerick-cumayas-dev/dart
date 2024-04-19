import 'package:flutter/material.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:fitguide_main/Components/Workout/workout_card.dart';

class FullBodyWorkoutListView extends StatefulWidget {
  final List<Workout> workouts;

  const FullBodyWorkoutListView({
    super.key,
    required this.workouts,
  });

  @override
  FullBodyWorkoutListViewState createState() => FullBodyWorkoutListViewState();
}

class FullBodyWorkoutListViewState extends State<FullBodyWorkoutListView> {
  final TextEditingController searchController = TextEditingController();
  List<Workout> foundWorkouts = [];
  bool isSearchEmpty = true;

  @override
  void initState() {
    super.initState();
    foundWorkouts = widget.workouts;
  }

  void filterWorkouts(String query) {
    setState(() {
      foundWorkouts = widget.workouts.where((workout) {
        return workout.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      isSearchEmpty = query.isEmpty; // Update the search status
    });
  }

  void clearSearch() {
    setState(() {
      searchController.clear();
      foundWorkouts = widget.workouts;
      isSearchEmpty = true; // Update the search status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: filterWorkouts,
              decoration: InputDecoration(
                labelText: 'Search Full Body Workouts',
                suffixIcon:
                    isSearchEmpty // Show clear icon only when search is not empty
                        ? const Icon(
                            Icons.search) // No icon when search is empty
                        : GestureDetector(
                            onTap: clearSearch,
                            child: const Icon(Icons.clear),
                          ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: foundWorkouts.length,
              itemBuilder: (BuildContext context, int index) {
                final workout = foundWorkouts[index];
                return WorkoutCardWidget(
                  workout: workout,
                  isEdit: false,
                  custom: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
