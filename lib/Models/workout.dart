import 'package:fitguide_main/Models/exercise.dart';

class Workout {
  final int id;
  final String name;
  final String description;
  final String image;
  final List<Exercise> exercises;

  Workout({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.exercises,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    var exercisesJson = json['exercises'] as List;
    List<Exercise> exercises = exercisesJson.map((exercise) => Exercise.fromJson(exercise)).toList();

    return Workout(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      exercises: exercises,
    );
  }
}