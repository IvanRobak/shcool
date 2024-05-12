import 'package:flutter/material.dart';
import 'package:shcool/main.dart';

class PlayCard extends StatelessWidget {
  const PlayCard({super.key, required this.image, required this.options});

  final String image;
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(
            image,
            width: 300,
            height: 300,
          ),
          const SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10, // Відступи між кнопками
            children: [
              for (int i = 0; i < options.length; i += 2)
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
                          backgroundColor: theme.colorScheme.onInverseSurface),
                      child: Text(options[i]),
                    ),
                    const SizedBox(width: 10),
                    if (i + 1 < options.length)
                      ElevatedButton(
                        onPressed: () {
                          // Дії при натисканні на варіант відповіді
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 40),
                            fixedSize: const Size(160, 50),
                            backgroundColor:
                                theme.colorScheme.onInverseSurface),
                        child: Text(options[i + 1]),
                      ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
