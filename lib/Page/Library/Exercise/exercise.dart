import 'package:flutter/material.dart';
import 'package:fitguide_main/Models/exercise.dart';
import 'package:fitguide_main/Components/Exercise/exercise_details.dart';
import 'package:fitguide_main/Components/Exercise/exercise_card.dart';

class ExercisesPage extends StatefulWidget {
  final List<Exercise> exercises;

  const ExercisesPage({
    super.key,
    required this.exercises,
  });

  @override
  ExercisesPageState createState() => ExercisesPageState();
}

class ExercisesPageState extends State<ExercisesPage> {
  final TextEditingController searchController = TextEditingController();
  List<Exercise> foundExercises = [];
  bool isSearchEmpty = true;

  @override
  void initState() {
    super.initState();
    foundExercises = widget.exercises;
  }

  void filterExercises(String query) {
    setState(() {
      foundExercises = widget.exercises.where((exercise) {
        return exercise.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      isSearchEmpty = query.isEmpty;
    });
  }

  void clearSearch() {
    setState(() {
      searchController.clear();
      foundExercises = widget.exercises;
      isSearchEmpty = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: filterExercises,
              decoration: InputDecoration(
                labelText: "Search Exercises",
                suffixIcon: isSearchEmpty
                    ? const Icon(Icons.search)
                    : GestureDetector(
                        onTap: clearSearch,
                        child: const Icon(Icons.clear),
                      ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => CreateWorkoutScreen(),
                //   ),
                // );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    Colors.purple, // Set the button background color
                backgroundColor: Colors.white, // Set the text color
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: 8),
                    Center(
                      child: Text(
                        "Edit Exercise",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: foundExercises.length,
                itemBuilder: (context, index) {
                  final exercise = foundExercises[index];
                  return ExerciseCard(
                    exercise: exercise,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ExerciseDetailsPage(exercise: exercise),
                          ),
                        );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const instructionPage(
          //         isInferencing: false,
          //       ),
          //     ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
