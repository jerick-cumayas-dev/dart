import 'dart:convert';
import 'package:fitguide_main/Services/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Models/user.dart';
import 'package:http/http.dart' as http;
import 'package:fitguide_main/State_Management/Providers/user_provider.dart';
import 'package:fitguide_main/Page/Main/main.dart';
import 'package:fitguide_main/Page/Notifications/notifications.dart';
import 'package:fitguide_main/Services/workouts_service.dart';
import 'package:fitguide_main/Services/user_workouts_service.dart';
import 'package:fitguide_main/Services/exercises_service.dart';
// import 'package:fitguide_main/State_Management/Providers/workout_provider.dart';

class AuthService {
  static Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    print('Requesting');
    final Uri uri = Uri(
      scheme: 'http',
      host: API.host,
      port: API.port,
      path: API.login,
    );

    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    // Prepare the request body
    final Map<String, String> body = {
      'email': email,
      'password': password,
    };

    // Send the POST request
    final http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode(body),
    );

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Parse the response JSON
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      User authUser = User.fromJson(responseData);

      //Store user to provider
      ref.read(userStateProvider.notifier).setUser(authUser);
      // ref.read(workoutStateProvider.notifier).setWorkouts(workouts);

      print("retrieving workouts");
      WorkoutService.retrieveWorkouts(ref: ref);
      print("retrieving exercises");
      ExerciseService.retrieveExercises(ref: ref);
      print("retrieving user workouts");
      UserWorkoutService.retrieveUserWorkouts(ref: ref, userId: authUser.id);

      if (!context.mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainView(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        successSnackBar(
            context, 'Welcome to FitGuide! Get good. One form at a time.'),
      );
    } else {
      // Handle the case where login is unsuccessful
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'Failed!'),
      );
    }
  }
}
