import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:fitguide_main/Components/Workout/workout_details.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AllWorkoutDetailsView extends ConsumerStatefulWidget {
  final List<Workout> workouts;

  const AllWorkoutDetailsView({super.key, required this.workouts});

  @override
  AllWorkoutDetailsViewState createState() => AllWorkoutDetailsViewState();
}

class AllWorkoutDetailsViewState extends ConsumerState<AllWorkoutDetailsView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.workouts.length,
              itemBuilder: (context, index) {
                final workout = widget.workouts[index];
                return WorkoutDetailsView(workout: workout);
              },
              onPageChanged: (int index) {},
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: widget.workouts.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: Colors.indigo,
              dotColor: Colors.grey,
              dotHeight: 16,
              dotWidth: 16,
            ),
          ),
        ],
      ),
    );
  }
}
