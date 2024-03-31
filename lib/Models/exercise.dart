class Exercise {
  final int id;
  final String name;
  final String description;
  final String image;
  final String difficulty;
  final int repetitions;
  final int sets;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.difficulty,
    required this.repetitions,
    required this.sets,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      difficulty: json['difficulty'],
      repetitions: json['repetitions'],
      sets: json['sets'],
    );
  }
}