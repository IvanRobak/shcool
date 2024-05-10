import 'package:flutter/material.dart';
import 'package:shcool/data/dummy_data.dart';
import 'package:shcool/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Вибери свій клас!'),
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
                for (final category in availableCategories)
                  CategoryGridItem(category: category)
              ]),
        ));
  }
}
