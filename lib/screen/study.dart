import 'package:flutter/material.dart';
import 'package:shcool/data/dummy_data.dart';
import 'package:shcool/widgets/bottom_navigation.dart';
import 'package:shcool/widgets/study_item.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Навчайся!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) {
            final card = cards[index];
            return StudyItem(
              imagePath: card.imagePath,
              title: card.title,
              card: card,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _selectedPageIndex,
        onSelect: _selectPage,
      ),
    );
  }
}
