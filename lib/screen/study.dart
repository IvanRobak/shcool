import 'package:flutter/material.dart';
import 'package:shcool/data/dummy_data.dart';
import 'package:shcool/widgets/study_tem.dart'; // Замініть на власний шлях

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Навчайся!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: GridView.count(
          crossAxisCount: 1, // 2 колонки
          children: List.generate(StudyItemData.items.length, (index) {
            final item = StudyItemData.items[index];
            return StudyItem(
              imagePath: item['imagePath']!,
              title: item['title']!,
            );
          }),
        ),
      ),
    );
  }
}
