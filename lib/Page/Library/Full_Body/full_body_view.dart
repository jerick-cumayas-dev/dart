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
  State<FullBodyWorkoutListView> createState() => _FullBodyWorkoutListView();
}

class _FullBodyWorkoutListView extends State<FullBodyWorkoutListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => CreateWorkoutScreen(),
            //       ),
            //     );
            //   },
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.purple, // Set the button background color
            //     onPrimary: Colors.white, // Set the text color
            //   ),
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Icon(Icons.add), // Add icon or any other widget you want
            //         SizedBox(width: 8), // Add some space between icon and text
            //         Center(
            //           child: Text(
            //             "Create Workout",
            //             style: TextStyle(fontSize: 16),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            ...widget.workouts.map((workout) {
              return WorkoutCardWidget(
                  workout: workout, isEdit: false, custom: false);
            }),
          ],
        ),
      ),
    );
  }
}
