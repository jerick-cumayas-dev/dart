import 'package:flutter/material.dart';
import 'package:fitguide_main/Components/Home/user_details.dart';
import 'package:fitguide_main/Components/Home/full_body_workout.dart';
import 'package:fitguide_main/Components/Home/user_workout.dart';
import 'package:fitguide_main/Components/Home/recent_activities.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print("Running home view");
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {},
        child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  const UserDetailsWidget(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  const FullBodyWorkoutsWidget(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  const UserWorkoutsWidget(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  const RecentActivitiesWidget(),
                ]))));
  }
}
