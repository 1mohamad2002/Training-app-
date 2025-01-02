import 'package:flutter/material.dart';
import 'dart:convert'; // For decoding JSON
import 'package:http/http.dart' as http;

class LegExercises extends StatefulWidget {
  const LegExercises({super.key});

  @override
  _LegExercisesState createState() => _LegExercisesState();
}

class _LegExercisesState extends State<LegExercises> {
  List<dynamic> exercises = []; // To store the list of exercises
  bool isLoading = true; // To handle loading state

  @override
  void initState() {
    super.initState();
    fetchExercises(); // Fetch exercises on page load
  }

  // Function to fetch exercises from the API
  Future<void> fetchExercises() async {
    try {
      final response = await http.get(
        Uri.parse('http://mohamadsukkar.onlinewebshop.net/legexercises.php'),
      );

      if (response.statusCode == 200) {
        setState(() {
          exercises = json.decode(response.body); // Parse JSON
          isLoading = false; // Set loading to false
        });
      } else {
        showError('Failed to fetch exercises. Please try again.');
      }
    } catch (e) {
      showError('An error occurred: $e');
    }
  }

  // Function to show an error message
  void showError(String message) {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leg Exercises'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.red,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return ExerciseCard(
            name: exercise['exercise_name'],
            description: exercise['description'],
            imageUrl: exercise['image_url'],
          );
        },
      ),
    );
  }
}

// A separate widget to display each exercise as a card
class ExerciseCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;

  const ExerciseCard({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
