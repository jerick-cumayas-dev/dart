import 'package:fitguide_main/Models/exercise.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/State_Management/Notifiers/exercise_notifier.dart';

final exerciseStateProvider =
    StateNotifierProvider<ExerciseStateNotifier, List<Exercise>>((ref) {
  return ExerciseStateNotifier([]);
});
