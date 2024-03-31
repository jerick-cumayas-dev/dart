import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Services/api/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fitguide_main/Models/exercise.dart';
import 'package:fitguide_main/State_Management/Providers/exercise_provider.dart';

class ExerciseService {
  static Future<void> retrieveExercises({required WidgetRef ref}) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: API.host,
      port: API.port,
      path: API.retrieveExercises,
    );

    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    final http.Response response = await http.get(
      uri,
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> responseData = jsonDecode(response.body);
      List<Exercise> exercises =
          responseData.map((data) => Exercise.fromJson(data)).toList();

      ref.read(exerciseStateProvider.notifier).setExercises(exercises);
    } else {
      throw Exception(
          'Failed to load exercises from the API. Status code: ${response.statusCode}');
    }
  }
}
