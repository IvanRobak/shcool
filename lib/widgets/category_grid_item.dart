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
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: category.color, // Default color
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
