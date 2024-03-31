import 'package:flutter/material.dart';

class RecentActivitiesWidget extends StatelessWidget {
  const RecentActivitiesWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Recent Activities",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => WorkoutListView(workouts: widget.customs),
              //   ),
              // );
            },
            child: const Text("See All"),
          ),
        )
      ],
    );
  }
}
