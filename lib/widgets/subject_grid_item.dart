import 'package:flutter/material.dart';
import 'package:shcool/model/category.dart';

class SubjectsGridItem extends StatelessWidget {
  const SubjectsGridItem({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Фіксована ширина картки
      height: 80,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.9),
            category.color.withOpacity(1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          category.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}