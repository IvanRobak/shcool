import 'package:flutter/material.dart';
import 'package:shcool/model/category.dart';

class SubjectsGridItem extends StatelessWidget {
  const SubjectsGridItem({
    super.key,
    required this.category,
    required this.onSelectSubject,
  });
  final CategoryModel category;

  final void Function() onSelectSubject;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectSubject,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.9),
              category.color.withOpacity(1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
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
      ),
    );
  }
}
