import 'package:flutter/material.dart';
import 'package:shcool/data/dummy_data.dart';
import 'package:shcool/screen/chapter.dart';
import 'package:shcool/widgets/bottom_navigation.dart';
import 'package:shcool/widgets/subject_grid_item.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectSubject(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const ChapterScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вибери предмет!'),
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
            children: [
              for (final category in availableSubjects)
                SubjectsGridItem(
                    category: category,
                    onSelectSubject: () {
                      _selectSubject(context);
                    })
            ]),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _selectedPageIndex,
        onSelect: _selectPage,
      ),
    );
  }
}
