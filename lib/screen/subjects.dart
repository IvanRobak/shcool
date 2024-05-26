import 'package:flutter/material.dart';
import 'package:shcool/model/class_model.dart';
import 'package:shcool/model/subject_model.dart';
import 'package:shcool/screen/chapter.dart';
import 'package:shcool/widgets/subject_grid_item.dart';

class SubjectScreen extends StatelessWidget {
  final ClassModel category;

  const SubjectScreen({super.key, required this.category});

  void _selectSubject(BuildContext context, SubjectModel subject) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => ChapterScreen(
              subject: subject,
              classId: category.id,
            )));
  }

  @override
  Widget build(BuildContext context) {
    final subjects = category.subjects.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Вибери предмет'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: subjects
              .map((subject) => SubjectGridItem(
                    subject: subject,
                    onSelectSubject: () {
                      _selectSubject(context, subject);
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
