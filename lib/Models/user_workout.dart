import 'package:fitguide_main/Models/workout.dart';
import 'package:fitguide_main/Models/user.dart';

class UserWorkout {
  final int id;
  final User user;
  final Workout workout;

  UserWorkout({
    required this.id,
    required this.user,
    required this.workout,
  });

  factory UserWorkout.fromJson(Map<String, dynamic> json) {
    return UserWorkout(
      id: json['id'],
      user: User.fromJson(json['user']),
      workout: Workout.fromJson(json['workout']),
    );
  }
}
