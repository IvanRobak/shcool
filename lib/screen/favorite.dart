import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shcool/providers/favorities_provider.dart';
import 'package:shcool/widgets/study_item.dart'; // імпортуйте свій StudyItem

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteCards = ref.watch(favoriteCardsNotifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Улюблені елементи'),
      ),
      body: ListView.builder(
        itemCount: favoriteCards.length,
        itemBuilder: (context, index) {
          final card = favoriteCards[index];
          return StudyItem(
            imagePath: card.imagePath,
            title: card.title,
            card: card,
            // description: card.description,
          );
        },
      ),
    );
  }
}
