import 'package:flutter/material.dart';
import 'package:shcool/model/class_model.dart';
import 'package:shcool/widgets/subject_grid_item.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key, required this.category});

  final ClassModel category;

  @override
  Widget build(BuildContext context) {
    final subjects = category.subjects.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Вибери предмет!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: subjects.length,
          itemBuilder: (ctx, index) {
            final subject = subjects[index];
            return SubjectGridItem(
              subject: subject,
              onSelectSubject: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //       builder: (ctx) => ChapterScreen(subject: subject)),
                // );
              },
            );
          },
        ),
      ),
    );
  }
}
