import 'package:flutter/material.dart';
import 'main.dart';

class InventarioPage extends StatelessWidget {
  final List<int> roupasCompradas; // Lista de roupas compradas
  final Function(int) equiparRoupa; // Função para equipar uma roupa no Chopper

  const InventarioPage({
    Key? key,
    required this.roupasCompradas,
    required this.equiparRoupa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventário'),
        backgroundColor: const Color(0xFFFFC0CB),
      ),
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'), // Caminho da imagem de fundo
                fit: BoxFit.cover, // Faz a imagem preencher a tela toda
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Roupas Compradas:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: roupasCompradas.map((index) {
                          return ElevatedButton(
                            onPressed: () {
                              equiparRoupa(index); // Equipa a roupa selecionada
                              Navigator.pop(context); // Retorna à página principal
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/roupa${index + 1}.png', // Caminho da imagem da roupa
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20), // Espaço entre o grid e o Chopper
                Expanded(
                  flex: 1,
                  child: ValueListenableBuilder<String>(
                    valueListenable: chopperImageNotifier,
                    builder: (context, chopperImage, child) {
                      return Image.asset(
                        chopperImage, // Usa a imagem atual do Chopper
                        width: 300,
                        height: 300,
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
