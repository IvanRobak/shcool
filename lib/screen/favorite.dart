import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Тут ви можете розмістити вміст вашого екрану з улюбленими елементами
    return Center(
      child: Text(
        'Улюблені елементи',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
