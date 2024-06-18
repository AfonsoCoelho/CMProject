import 'package:flutter/material.dart';
import 'main.dart';

class MiniJogoPage extends StatefulWidget {
  const MiniJogoPage({Key? key}) : super(key: key);

  @override
  _MiniJogoPageState createState() => _MiniJogoPageState();
}

class _MiniJogoPageState extends State<MiniJogoPage> {
  double _currentMoneyWon = 0.0;

  void _addRandomCoins() {
    setState(() {
      double coinsWon = (25 + (175 * (DateTime.now().millisecondsSinceEpoch % 1000 / 1000))).toInt().toDouble();
      moneyNotifier.value += coinsWon;
      _currentMoneyWon = coinsWon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Jogo'),
        backgroundColor: const Color(0xFFFFC0CB),
        actions: [
          Row(
            children: [
              ValueListenableBuilder<double>(
                valueListenable: moneyNotifier,
                builder: (context, money, child) {
                  return Text(
                    '\$$money',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  );
                },
              ),
              Image.asset(
                'assets/moeda.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Layout principal
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: List.generate(12, (index) {
                          return SizedBox(
                            width: 80,
                            height: 80,
                            child: ElevatedButton(
                              onPressed: _addRandomCoins,
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Image.asset(
                                'assets/tesouro.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      if (_currentMoneyWon > 0)
                        Text(
                          'Ganhou \$$_currentMoneyWon!',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 20), // Espaço entre os botões e a imagem do Chopper
                Expanded(
                  flex: 1,
                  child: ValueListenableBuilder<String>(
                    valueListenable: chopperImageNotifier,
                    builder: (context, chopperImage, child) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          chopperImage, // Usa a imagem atual do Chopper
                          width: 150,
                          height: 150,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
