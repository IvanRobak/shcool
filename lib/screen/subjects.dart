import 'package:flutter/material.dart';
import 'package:shcool/data/dummy_data.dart';
import 'package:shcool/widgets/subject_grid_item.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Навчайся або грайся :)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (final category in availableSubjects)
                Column(
                  children: [
                    SubjectsGridItem(category: category),
                    // Простір між карткою і кнопками
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Дії при натисканні на першу кнопку
                          },
                          child: const Text('Вчити'),
                        ),
                        const SizedBox(width: 60),
                        ElevatedButton(
                          onPressed: () {
                            // Дії при натисканні на другу кнопку
                          },
                          child: const Text('Грати'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
