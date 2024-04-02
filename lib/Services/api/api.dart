class API {
  static const String host = "172.29.7.74";
  static const int port = 4000;
  static const String api = "/api";

  // Authentication
  static const String login = "$api/users/login/";
  // static const String login = "api/auth";

  static const String retrieveWorkouts = "$api/workouts/read/";

  static const String retrieveUserWorkouts = "$api/user_workouts/read-user/";

  static const String retrieveExercises = "$api/exercises/read/";

  // Register/Create an account
  static const String register = "$api/users/register";

  // Construct base URL
  static String get baseUrl => "http://$host:$port";
}
