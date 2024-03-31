import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Models/exercise.dart';

class ExerciseStateNotifier extends StateNotifier<List<Exercise>> {
  ExerciseStateNotifier(super.state);

  void setExercises(List<Exercise> exercises) {
    state = exercises;
  }

  void resetState() {
    state = [];
  }
}
