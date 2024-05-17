import 'package:flutter/material.dart';
import 'package:shcool/model/card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shcool/providers/favorities_provider.dart';

class StudyItem extends ConsumerStatefulWidget {
  const StudyItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.card,
  });

  final String imagePath;
  final String title;
  final CardModel card;

  @override
  ConsumerState<StudyItem> createState() => _StudyItemState();
}

class _StudyItemState extends ConsumerState<StudyItem> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = ref.read(favoriteCardsNotifier).contains(widget.card);
  }

  @override
  Widget build(BuildContext context) {
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
                  widget.imagePath,
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
                      widget.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                ],
              ),
            ],
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
                    .toggleCardsFavotiStatus(widget.card);
                setState(() {
                  isFavorite = !isFavorite;
                });
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isFavorite
                        ? 'Card was added as a favorite'
                        : 'Card removed from favorites'),
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
