import 'package:flutter/material.dart';
import 'package:shcool/model/card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shcool/providers/favorities_provider.dart';
import 'package:shcool/screen/card_detail.dart';

class StudyItem extends ConsumerWidget {
  const StudyItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.card,
    // required this.description,
  });

  final String imagePath;
  final String title;
  final CardModel card;
  // final String description;
  void _selectDescription(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => CardDetailScreen(card: card)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteCardsNotifier).contains(card);

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black.withOpacity(0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 277,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: IconButton(
              icon: const Icon(
                Icons.lightbulb,
              ),
              onPressed: () {
                _selectDescription(context);
              },
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                ref
                    .read(favoriteCardsNotifier.notifier)
                    .toggleCardsFavotiStatus(card);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isFavorite
                        ? 'Картка видалена з улюблених'
                        : 'Картка додана до улюблених'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
