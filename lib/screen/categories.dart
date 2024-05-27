import 'package:flutter/material.dart';
import 'package:shcool/screen/auth.dart';
import 'package:shcool/screen/subjects.dart';
import 'package:shcool/widgets/category_grid_item.dart';
import 'package:shcool/services/data_service.dart';
import 'package:shcool/model/class_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _selectCategory(BuildContext context, ClassModel category) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => SubjectScreen(category: category)));
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
      body: FutureBuilder<List<ClassModel>>(
        future: DataService().loadClasses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Помилка завантаження даних'));
          } else if (snapshot.hasData) {
            final classes = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(30),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 40,
                ),
                children: classes
                    .map((category) => CategoryGridItem(
                          category: category,
                          onSelectCategory: () {
                            _selectCategory(context, category);
                          },
                        ))
                    .toList(),
              ),
            );
          } else {
            return const Center(child: Text('Немає даних'));
          }
        },
      ),
    );
  }
}
