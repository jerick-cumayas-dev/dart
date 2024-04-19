class API {
  static const String host = "10.0.18.241";
  static const int port = 4000;
  static const String api = "/api";

  // Authentication
  static const String login = "$api/users/login/";
  // static const String login = "api/auth";

  static const String retrieveWorkouts = "$api/workouts/read/";

  static const String createWorkout = "$api/workouts/create/";

  static const String retrieveUserWorkouts = "$api/user_workouts/read-user/";
  static const String createUserWorkout = "$api/user_workouts/create/";
  static const String updateUserWorkout = "$api/workouts/update/";

  static const String retrieveExercises = "$api/exercises/read/";

  // Register/Create an account
  static const String register = "$api/users/register";

  // Construct base URL
  static String get baseUrl => "http://$host:$port";
}
