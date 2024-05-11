import 'package:flutter/material.dart';
import 'package:shcool/data/dummy_data.dart';
import 'package:shcool/screen/study.dart';
import 'package:shcool/widgets/chapter_grid.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({super.key});

  void _selectChapter(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const StudyScreen()));
  }

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
              for (final category in availableChapters)
                Column(
                  children: [
                    ChapterGridItem(category: category),
                    // Простір між карткою і кнопками
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _selectChapter(context);
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
