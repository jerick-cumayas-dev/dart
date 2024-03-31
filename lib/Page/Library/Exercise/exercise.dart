import 'package:flutter/material.dart';
import 'package:fitguide_main/Models/exercise.dart';
import 'package:fitguide_main/Services/api/api.dart';

class ExercisesView extends StatelessWidget {
  final List<Exercise> exercises;

  const ExercisesView({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: Column(
          children: [
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
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final exercise = exercises[index];
                  return Card(
                    color: Colors.white,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.25,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              bottomLeft: Radius.circular(16.0),
                            ),
                            child: SizedBox(
                              height: double.infinity,
                              width: 100,
                              child: Image.network(
                                '${API.baseUrl}/${exercise.image}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.030,
                                top: MediaQuery.of(context).size.width * 0.020,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.025,
                                right:
                                    MediaQuery.of(context).size.width * 0.020,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exercise.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.000020),
                                  Text(
                                    exercise.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.000020),
                                  Text(
                                    'Difficulty: ${exercise.difficulty}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
