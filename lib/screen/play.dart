import 'package:flutter/material.dart';
import 'package:shcool/data/dummy_data.dart';
import 'package:shcool/widgets/play_card.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Грайся!'),
      ),
      body: SizedBox(
        height: 500, // фіксована висота ListView
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 1), // додати відступи між картками
              child: PlayCard(
                image: cards[index].image,
                options: cards[index].options,
              ),
            );
          },
        ),
      ),
    );
  }
}
