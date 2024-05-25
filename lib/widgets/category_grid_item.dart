import 'package:flutter/material.dart';
import 'package:shcool/model/class_model.dart';

class CategoryGridItem extends StatelessWidget {
  final ClassModel category;
  final VoidCallback onSelectCategory;

  const CategoryGridItem({
    required this.category,
    required this.onSelectCategory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
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
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            category.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
