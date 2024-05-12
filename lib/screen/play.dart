import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Грайся!'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Flexible(
            child: Image.asset(
              'assets/images/circle.png',
              fit: BoxFit.contain,
              width: 300, // Зменшити картинку до доступного простору
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20, // Встановіть відступи між рядами
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Дії при натисканні на перший варіант відповіді
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 40),
                      fixedSize: const Size(160, 50),
                    ),
                    child: const Text('Трикутник'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Дії при натисканні на другий варіант відповіді
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 40),
                      fixedSize: const Size(160, 50),
                    ),
                    child: const Text('Квадрат'),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Дії при натисканні на третій варіант відповіді
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 40),
                      fixedSize: const Size(160, 50),
                    ),
                    child: const Text('Круг'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Дії при натисканні на четвертий варіант відповіді
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 40),
                        fixedSize: const Size(160, 50)),
                    child: const Text('Прямокутник'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
