import 'package:flutter/material.dart';
import 'package:shcool/main.dart';
import 'package:shcool/model/category.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CardModel> cards = [
      CardModel(
        image: 'assets/images/circle.png',
        options: ['Трикутник', 'Квадрат', 'Круг', 'Прямокутник'],
      ),
      CardModel(
        image: 'assets/images/triangle.png',
        options: ['Квадрат', 'Прямокутник', 'Круг', 'Трикутник'],
      ),
      // Додайте інші картки за потребою
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Грайся!'),
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset(
                  cards[index].image,
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10, // Відступи між кнопками
                  children: [
                    for (int i = 0; i < cards[index].options.length; i += 2)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Дії при натисканні на варіант відповіді
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 40),
                                fixedSize: const Size(160, 50),
                                backgroundColor:
                                    theme.colorScheme.onInverseSurface),
                            child: Text(cards[index].options[i]),
                          ),
                          const SizedBox(width: 10),
                          if (i + 1 < cards[index].options.length)
                            ElevatedButton(
                              onPressed: () {
                                // Дії при натисканні на варіант відповіді
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(0, 40),
                                  fixedSize: const Size(160, 50),
                                  backgroundColor:
                                      theme.colorScheme.onInverseSurface),
                              child: Text(cards[index].options[i + 1]),
                            ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
