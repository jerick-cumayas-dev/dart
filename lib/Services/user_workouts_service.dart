import 'package:fitguide_main/Services/api/api.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/State_Management/Providers/user_workout_provider.dart';
import 'package:fitguide_main/Models/user_workout.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserWorkoutService {
  static Future<void> retrieveUserWorkouts(
      {required WidgetRef ref, required int userId}) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: API.host,
      port: API.port,
      path: API.retrieveUserWorkouts,
    );

    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    final body = jsonEncode({"user_id": userId});

    final http.Response response = await http.post(
      uri,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      List<dynamic> responseData = jsonDecode(response.body);
      List<UserWorkout> userWorkouts =
          responseData.map((json) => UserWorkout.fromJson(json)).toList();
      List<Workout> workouts =
          userWorkouts.map((userWorkout) => userWorkout.workout).toList();

      ref.read(userWorkoutStateProvider.notifier).setWorkouts(workouts);
    } else {
      throw Exception(
          'Failed to load user workouts from the API. Status code: ${response.statusCode}');
    }
  }
}