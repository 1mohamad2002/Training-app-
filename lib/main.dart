import 'package:flutter/material.dart';
import './Home.dart';

void main() {
  runApp(ExerciserApp());
}

class ExerciserApp extends StatelessWidget {
  const ExerciserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exerciser App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
