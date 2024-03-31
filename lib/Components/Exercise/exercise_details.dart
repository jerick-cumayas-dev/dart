import 'package:flutter/material.dart';
import 'package:fitguide_main/Models/exercise.dart';
import 'package:fitguide_main/Services/api/api.dart';

class ExerciseDetailsView extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailsView({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                image: DecorationImage(
                  image: NetworkImage(
                      '${API.baseUrl}/${exercise.image}'), // Use the assetImagePath from the Exercise object
                  fit: BoxFit
                      .cover, // Set the BoxFit property to adjust how the image is displayed within the container.
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    '${exercise.name} image',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              exercise.name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text('Description: ${exercise.description}',
                style: const TextStyle(color: Colors.black)),
            const SizedBox(height: 10),
            Text('Difficulty: ${exercise.difficulty}',
                style: const TextStyle(color: Colors.black)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
