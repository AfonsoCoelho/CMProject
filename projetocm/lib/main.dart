import 'package:flutter/material.dart';
import 'store.dart';
import 'inventory.dart';
import 'profile.dart';
import 'minigame.dart';
import 'transformation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tony Tony Chopper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _hungerLevel = 0.5;
  final double _happinessLevel = 0.8;
  double _money = 100.0;

  void _showFoodOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Lógica para alimentar com comida 1
                  setState(() {
                    _hungerLevel += 0.1;
                    if (_hungerLevel > 1.0) _hungerLevel = 1.0;
                  });
                  Navigator.pop(context);
                },
                child: Image.asset('assets/comida1.png'), // Imagem da comida 1
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para alimentar com comida 2
                  setState(() {
                    _hungerLevel += 0.2;
                    if (_hungerLevel > 1.0) _hungerLevel = 1.0;
                  });
                  Navigator.pop(context);
                },
                child: Image.asset('assets/comida2.png'), // Imagem da comida 1
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para alimentar com comida 3
                  setState(() {
                    _hungerLevel += 0.3;
                    if (_hungerLevel > 1.0) _hungerLevel = 1.0;
                  });
                  Navigator.pop(context);
                },
                child: Image.asset('assets/comida3.png'), // Imagem da comida 1
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tony Tony Chopper'),
        backgroundColor: const Color(0xFFFFC0CB), // Cor de fundo rosa bebê para a AppBar
        actions: [
          Row(
            children: [
              Text(
                '$_money', // Exibe o valor do dinheiro
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'assets/moeda.png', // Caminho da imagem da moeda
                width: 30, // Tamanho da imagem da moeda
                height: 30, // Tamanho da imagem da moeda
              ),
              const SizedBox(width: 10),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.store), // Ícone da loja
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LojaPage(
                    money: _money, // Passa a quantidade de dinheiro para a loja
                    onPurchase: (cost) {
                      setState(() {
                        _money -= cost; // Atualiza o dinheiro ao comprar algo
                    });
                  }
                )),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.inventory),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InventarioPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PerfilPage()),
              );
            },
          ),
          IconButton(
            icon: Image.asset('assets/tesouro.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MiniJogoPage()),
              );
            },
          ),
          IconButton(
            icon: Image.asset('assets/transformacao.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TransformationPage()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/chopper1.png',
              width: 600,
              height: 600,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fome',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  height:20,
                  child: LinearProgressIndicator(
                    value: _hungerLevel,
                    backgroundColor: Colors.grey[300],
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Felicidade',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  height:20,
                  child: LinearProgressIndicator(
                    value: _happinessLevel,
                    backgroundColor: Colors.grey[300],
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                _showFoodOptions(context);
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.fastfood),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          color: const Color(0xFFFFC0CB), // Cor de fundo rosa bebê para o Footer
          alignment: Alignment.center,
          child: const Text(
            'Tony Tony Chopper',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

