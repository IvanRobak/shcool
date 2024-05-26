import 'package:flutter/material.dart';
import 'package:shcool/model/chapter_model.dart';

class ChapterGridItem extends StatelessWidget {
  final ChapterModel chapter;

  const ChapterGridItem({
    required this.chapter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Фіксована ширина картки
      height: 80,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            chapter.color.withOpacity(0.9),
            chapter.color.withOpacity(1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Center(
        child: Text(
          chapter.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
