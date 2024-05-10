import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вибери свій клас!'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(50),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          _buildCategoryCircle('1', Colors.purple),
          _buildCategoryCircle('2', Colors.red),
          _buildCategoryCircle('3', Colors.orange),
          _buildCategoryCircle('4', Colors.amber),
          _buildCategoryCircle('5', Colors.blue),
          _buildCategoryCircle('6', Colors.green),
        ],
      ),
    );
  }

  Widget _buildCategoryCircle(String text, Color color) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
