import 'package:fitguide_main/Services/api/api.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:fitguide_main/State_Management/Providers/workout_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WorkoutService {
  static Future<void> retrieveWorkouts({required WidgetRef ref}) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: API.host,
      port: API.port,
      path: API.retrieveWorkouts,
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
      List<Workout> workouts =
          responseData.map((data) => Workout.fromJson(data)).toList();

      ref.read(workoutStateProvider.notifier).setWorkouts(workouts);
    } else {
      throw Exception(
          'Failed to load workouts from the API. Status code: ${response.statusCode}');
    }
  }
}
