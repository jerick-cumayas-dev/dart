import 'package:flutter/material.dart';
import 'package:fitguide_main/Models/exercise.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:fitguide_main/Components/Exercise/exercise_details.dart';
import 'package:fitguide_main/Core/modes/inferencing/inferencing(seamless).dart';
import 'package:fitguide_main/Services/api/api.dart';

class WorkoutDetailsView extends StatelessWidget {
  final Workout workout;

  WorkoutDetailsView({super.key, required this.workout});

  final Map<String, dynamic> exerciseDetail1 = {
    'nameOfExercise': "Oblique Twist",
    'restDuration': 15,
    'setsNeeded': 1,
    'numberOfExecution': 1,
    'modelPath': 'assets/models/wholeModel/obliqueTwistV3.tflite',
    'videoPath': 'FrontEnd/assets/videos/jumpNjacksVid.mp4',
    // still need to implement extraction of ignored coordinates when collecting data!
    'ignoredCoordinates': ["left_arm", "left_leg"],
    'inputNum': 8,
  };

  final Map<String, dynamic> exerciseDetail2 = {
    'nameOfExercise': "Jumping Jacks",
    'restDuration': 15,
    'setsNeeded': 1,
    'numberOfExecution': 5,
    'modelPath':
        'assets/models/wholeModel/converted_model_whole_model4782(loss_0.005)(acc_0.999).tflite',
    'videoPath': 'assets/videos/jumpNjacksVid.mp4',
    'ignoredCoordinates': ["left_arm", "left_leg"],
    'inputNum': 9,
  };

  List<Map<String, dynamic>> get exerciseProgram1 =>
      // [exerciseDetail2, exerciseDetail1];
      [exerciseDetail2, exerciseDetail2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // color: Colors.white.withOpacity(0.3),
                  image: DecorationImage(
                    image: NetworkImage(
                        '${API.baseUrl}/${workout.image}'), // Use the assetImagePath from the Exercise object
                    fit: BoxFit
                        .cover, // Set the BoxFit property to adjust how the image is displayed within the container.
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
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Table(columnWidths: const {
                0: FractionColumnWidth(0.4),
                1: FractionColumnWidth(0.2),
                2: FractionColumnWidth(0.2),
                3: FractionColumnWidth(0.2),
              }, children: [
                buildRowTitle(['Exercise', 'Sets', 'Reps', 'Info'],
                    isHeader: true),
              ]),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Table(
                    columnWidths: const {
                      0: FractionColumnWidth(0.4),
                      1: FractionColumnWidth(0.2),
                      2: FractionColumnWidth(0.2),
                      3: FractionColumnWidth(0.2),
                    },
                    children: [
                      ...workout.exercises.map((exercise) {
                        return buildRow(
                            context,
                            [
                              exercise.name,
                              exercise.sets.toString(),
                              exercise.repetitions.toString(),
                            ],
                            exercise);
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => inferencingSeamless(
                                  exerciseList: exerciseProgram1,
                                )),
                      );
                    },
                    child: const Text("Start Workout")),
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: const Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  TableRow buildRowTitle(List<String> cells, {bool isHeader = false}) =>
      TableRow(
        children: cells.map((cell) {
          final style = TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
            fontSize: isHeader ? 17 : 13,
          );

          return Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              cell, // Use the current cell value
              style: style,
            ),
          );
        }).toList(), // Don't forget to convert the mapped Iterable to a List
      );

  TableRow buildRow(BuildContext context, List<String> cells, Exercise exercise,
          {bool isHeader = false}) =>
      TableRow(
        children: [
          ...cells.map((cell) {
            final style = TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: Colors.black,
              fontSize: isHeader ? 17 : 13,
            );

            return Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                cell, // Use the current cell value
                style: style,
              ),
            );
          }),
          GestureDetector(
            onTap: () {
              // Add the navigation logic or any action you want
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExerciseDetailsPage(exercise: exercise),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(
                Icons.info, // Replace with your desired note icon
                color: Colors.black,
                size: isHeader ? 24 : 20,
              ),
            ),
          ),
        ],
      );
}
