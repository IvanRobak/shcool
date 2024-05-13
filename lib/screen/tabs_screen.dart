import 'package:flutter/material.dart';
import 'package:shcool/screen/categories.dart';
import 'package:shcool/screen/favorite.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_selectedPageIndex == 0 ? 'Categories' : 'Subjects'),
      // ),
      body: _selectedPageIndex == 0
          ? const CategoryScreen()
          : const FavoriteScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Головна',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Улюблене',
          ),
        ],
      ),
    );
  }
}
