import 'package:flutter/material.dart';
import 'package:shcool/widgets/study_tem.dart'; // Замініть на власний шлях

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Screen'),
      ),
      body: GridView.count(
        crossAxisCount: 1, // 2 колонки
        children: const [
          StudyItem(imagePath: 'assets/images/circle.png', title: 'Назва 1'),
          StudyItem(imagePath: 'assets/images/triangle.png', title: 'Назва 2'),
          StudyItem(imagePath: 'assets/images/rectangle.png', title: 'Назва 3'),
          StudyItem(imagePath: 'assets/images/square.png', title: 'Назва 4'),
        ],
      ),
    );
  }
}
