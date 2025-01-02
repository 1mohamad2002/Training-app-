import 'package:flutter/material.dart';
import 'arm_exercises.dart';
import 'chess_exercises.dart';
import 'leg_exercises.dart';

class ExerciseCategories extends StatelessWidget {
  const ExerciseCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Categories'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1637430308606-86576d8fef3c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFyayUyMGd5bXxlbnwwfHwwfHx8MA%3D%3D',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2, // 2 categories per row
          padding: EdgeInsets.all(16.0),
          children: [
            CategoryCard(
              title: 'Chest',
              imageUrl:
              'https://t4.ftcdn.net/jpg/01/10/74/03/360_F_110740347_R0on6rdMNsHv8keMk8DBktMMA8ApxtVE.jpg',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChessExercises(),
                  ),
                );
              },
            ),
            CategoryCard(
              title: 'Legs',
              imageUrl:
              'https://img.pikbest.com/ai/illus_our/20230423/8230e830448ae0a5689ec83d51d6aef2.jpg!w700wp',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LegExercises(),
                  ),
                );
              },
            ),
            CategoryCard(
              title: 'Arms',
              imageUrl:
              'https://bod-blog-assets.prod.cd.beachbodyondemand.com/bod-blog/wp-content/uploads/2022/06/14153612/arm-muscles-600-biceps-anatomy.jpg',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArmExercises(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onPressed;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        child: Column(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
