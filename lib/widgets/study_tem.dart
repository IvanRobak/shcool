import 'package:flutter/material.dart';

class StudyItem extends StatelessWidget {
  const StudyItem({
    super.key,
    required this.imagePath,
    required this.title,
  });

  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath),
      ],
    );
  }
}
