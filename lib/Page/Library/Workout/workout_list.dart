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
  WorkoutListViewState createState() => WorkoutListViewState();
}

class WorkoutListViewState extends State<WorkoutListView> {
  final TextEditingController searchController = TextEditingController();
  List<Workout> foundWorkouts = [];
  bool isSearchEmpty = true;
  bool isEdit = false;

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
      isSearchEmpty = true;
    });
  }

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
              TextField(
                controller: searchController,
                onChanged: filterWorkouts,
                decoration: InputDecoration(
                    labelText: 'Search Workouts',
                    suffixIcon: isSearchEmpty
                        ? const Icon(Icons.search)
                        : GestureDetector(
                            onTap: clearSearch,
                            child: const Icon(Icons.clear),
                          )),
              ),
              const SizedBox(height: 10.0),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.006),
                    Text(
                      "Edit Workout",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: foundWorkouts.length,
                itemBuilder: (BuildContext context, int index) {
                  final workout = foundWorkouts[index];
                  return WorkoutCardWidget(
                    workout: workout,
                    isEdit: isEdit,
                    custom: false,
                  );
                },
              ),
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
