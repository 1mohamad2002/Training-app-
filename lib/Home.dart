import 'package:flutter/material.dart';
import 'exercises_categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exerciser App',
          style: TextStyle(color: const Color.fromARGB(255, 243, 33, 33)),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
            NetworkImage('https://t4.ftcdn.net/jpg/00/99/82/15/360_F_99821575_nVEHTBXzUnTcLIKN6yOymAWAnFwEybGb.jpg'), // Path to your image
            fit: BoxFit.cover, // Makes sure the image covers the entire screen
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to the Exerciser App!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(
                      255, 255, 0, 0), // Set text color for visibility
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Discover exercises for every muscle group and learn how to perform them correctly to stay fit and healthy.',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(
                      255, 255, 9, 9), // Set text color for visibility
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExerciseCategories()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                child: Text(
                  'Explore Exercises',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Spacer(),
              Center(
                child: Text(
                  'About Us: We are passionate about fitness and dedicated to helping you achieve your goals.',
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(
                        255, 249, 12, 12), // Set text color for visibility
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
