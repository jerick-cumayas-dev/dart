class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String profilePicture;
  String dateJoined;
  String lastLogin;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
    required this.dateJoined,
    required this.lastLogin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      profilePicture: json['profilePicture'],
      dateJoined: json['date_joined'],
      lastLogin: json['last_login'],
    );
  }

  @override
  String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, profilePicture: $profilePicture, dateJoined: $dateJoined, lastLogin: $lastLogin)';
  }
}
