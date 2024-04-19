import 'package:fitguide_main/Page/Notifications/notifications.dart';
import 'package:fitguide_main/Services/api/api.dart';
import 'package:fitguide_main/Models/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/State_Management/Providers/user_workout_provider.dart';
import 'package:fitguide_main/State_Management/Providers/user_provider.dart';
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

  static Future<Workout> createWorkout(
      {required BuildContext context,
      required WidgetRef ref,
      required String workoutName,
      required String workoutDescription,
      required List<int> selectedExercises}) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: API.host,
      port: API.port,
      path: API.createWorkout,
    );

    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    var body = jsonEncode({
      "name": workoutName,
      "description": workoutDescription,
      "isCustom": true,
      "exercises": selectedExercises,
    });

    try {
      ScaffoldMessenger.of(context).showSnackBar(
        successSnackBar(context, 'Creating your workout.'),
      );
      final http.Response response = await http.post(
        uri,
        headers: headers,
        body: body,
      );
      print("CREATED WORKOUT");
      if (response.statusCode == 201) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        return Workout.fromJson(jsonResponse);
      } else {
        throw Exception(
            'Failed to create workout from the API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load user workouts from the API: $e');
    }
  }

  static Future<void> createUserWorkout(
      {required BuildContext context,
      required WidgetRef ref,
      required String workoutName,
      required String workoutDescription,
      required List<int> selectedExercises}) async {
    Workout userWorkout = await createWorkout(
        context: context,
        ref: ref,
        workoutName: workoutName,
        workoutDescription: workoutDescription,
        selectedExercises: selectedExercises);
    final user = ref.watch(userStateProvider);

    final Uri uri = Uri(
      scheme: 'http',
      host: API.host,
      port: API.port,
      path: API.createUserWorkout,
    );

    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    var body = jsonEncode({"user": user.id, "workout": userWorkout.id});

    try {
      ScaffoldMessenger.of(context).showSnackBar(
        successSnackBar(
            context, 'Be sure to check statistics after every workout.'),
      );
      final http.Response response = await http.post(
        uri,
        headers: headers,
        body: body,
      );
      print("CREATED USER WORKOUT");
      if (response.statusCode == 201) {
        retrieveUserWorkouts(ref: ref, userId: user.id);
        print("NICEESUUU");
      } else {
        throw Exception(
            'Failed to create user workout from the API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load user workouts from the API: $e');
    }
  }

  static Future<void> updateUserWorkout(
      {required BuildContext context,
      required WidgetRef ref,
      required int workoutId,
      required String workoutName,
      required String workoutDescription,
      required List<int> selectedExercises}) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: API.host,
      port: API.port,
      path: API.updateUserWorkout,
    );

    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    var body = jsonEncode({
      "id": workoutId,
      "name": workoutName,
      "description": workoutDescription,
      "isCustom": true,
      "exercises": selectedExercises,
    });

    final user = ref.watch(userStateProvider);

    try {
      ScaffoldMessenger.of(context).showSnackBar(
        successSnackBar(context, 'Updating workout in database.'),
      );

      final http.Response response = await http.put(
        uri,
        headers: headers,
        body: body,
      );
      print(response.statusCode);
      if (response.statusCode == 201) {
        retrieveUserWorkouts(ref: ref, userId: user.id);
        ScaffoldMessenger.of(context).showSnackBar(
          successSnackBar(context, 'Workout has been updated.'),
        );
      }
    } catch (e) {
      throw Exception('Failed to updated workout. Status code: ');
    }
  }

  static Future<void> deleteWorkout(
      {required BuildContext context,
      required WidgetRef ref,
      required int userId,
      required int workoutId}) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: API.host,
      port: API.port,
      path: API.createUserWorkout,
    );

    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    var body = jsonEncode({
      "id": workoutId,
    });

    try {
      await http.post(
        uri,
        headers: headers,
        body: body,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        successSnackBar(context, 'Deletion of workout is now processing.'),
      );

      await Future.delayed(const Duration(seconds: 2));

      retrieveUserWorkouts(ref: ref, userId: userId);

      ScaffoldMessenger.of(context).showSnackBar(
        successSnackBar(context, 'Workout has been successfully deleted.'),
      );
    } catch (e) {
      throw Exception('Failed to delete user workout from the API: $e');
    }
  }
}
