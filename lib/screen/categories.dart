import 'package:flutter/material.dart';
import 'package:shcool/data/dummy_data.dart';
import 'package:shcool/screen/auth.dart';
import 'package:shcool/screen/subjects.dart';
import 'package:shcool/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const SubjectScreen()));
  }

  void _selectAuth(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const AuthScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Вибери свій клас!'),
          actions: [
            IconButton(
                onPressed: () {
                  _selectAuth(context);
                },
                icon: const Icon(Icons.person))
          ],
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
                  CategoryGridItem(
                    category: category,
                    onSelectCategory: () {
                      _selectCategory(context);
                    },
                  )
              ]),
        ));
  }
}
