import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onSelect;

  const BottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) {
          _goToHome(context);
        } else if (index == 1) {
          _goToFavorite(context);
        }
      },
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
    );
  }

  void _goToHome(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _goToFavorite(BuildContext context) {
    Navigator.of(context).pushNamed('/favorite');
  }
}
