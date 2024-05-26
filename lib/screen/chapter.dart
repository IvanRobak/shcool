import 'package:flutter/material.dart';
import 'package:shcool/model/subject_model.dart';
import 'package:shcool/screen/play.dart';
import 'package:shcool/screen/study.dart';
import 'package:shcool/widgets/chapter_grid.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen(
      {super.key, required this.classId, required this.subject});

  final String classId;
  final SubjectModel subject;

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  void _selectPlay(BuildContext context, String chapterId) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => PlayScreen(
              classId: widget.classId,
              subjectId: widget.subject.id,
              chapterId: chapterId,
            )));
  }

  void _selectStudy(BuildContext context, String chapterId) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => StudyScreen(
              classId: widget.classId,
              subjectId: widget.subject.id,
              chapterId: chapterId,
            )));
  }

  @override
  Widget build(BuildContext context) {
    final chapters = widget.subject.chapters;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Навчайся або грайся :)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: chapters.entries.map((entry) {
              final chapterId = entry.key;
              final chapter = entry.value;
              return Column(
                children: [
                  ChapterGridItem(
                    chapter: chapter,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _selectStudy(context, chapterId);
                        },
                        child: const Text('Вчити'),
                      ),
                      const SizedBox(width: 60),
                      ElevatedButton(
                        onPressed: () {
                          _selectPlay(context, chapterId);
                        },
                        child: const Text('Грати'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
