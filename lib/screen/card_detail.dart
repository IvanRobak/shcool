import 'package:flutter/material.dart';
import 'package:shcool/model/card.dart';

class CardDetailScreen extends StatelessWidget {
  const CardDetailScreen({super.key, required this.card});

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: Text(card.description,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
        ),
      ),
    );
  }
}
