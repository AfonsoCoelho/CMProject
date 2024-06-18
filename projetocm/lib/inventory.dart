// inventory.dart

import 'package:flutter/material.dart';
import 'main.dart';

class InventarioPage extends StatelessWidget {
  final List<int> roupasCompradas; // Lista de roupas compradas
  final Function(int) equiparRoupa; // Função para equipar roupa

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
        backgroundColor: const Color(0xFFFFC0CB), // Cor de fundo rosa bebê para a AppBar
        actions: [
          ValueListenableBuilder<double>(
            valueListenable: moneyNotifier,
            builder: (context, money, child) {
              return Row(
                children: [
                  Text(
                    '\$$money', // Exibe o valor do dinheiro
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/moeda.png', // Caminho da imagem da moeda
                    width: 30, // Tamanho da imagem da moeda
                    height: 30, // Tamanho da imagem da moeda
                  ),
                  const SizedBox(width: 10),
                ],
              );
            },
          ),
        ],
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
          // Conteúdo da página
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC0CB), // Cor de fundo rosa bebê
                    borderRadius: BorderRadius.circular(10), // Borda arredondada
                  ),
                  child: const Text(
                    'Escolha uma roupa para equipar:',
                    style: TextStyle(
                      fontSize: 20, // Tamanho do texto
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Botões com imagens organizados em uma grade 3x2
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: roupasCompradas.map((index) {
                    return SizedBox(
                      width: 100,
                      height: 150,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              equiparRoupa(index);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/roupa${index + 1}.png', // Substitua pelo caminho das imagens de roupa
                                fit: BoxFit.cover, // Ajusta a imagem para cobrir todo o botão
                              ),
                            ),
                          ),
                          Text(
                            'Roupa ${index + 1}', // Nome da roupa
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          // Adicionar o Chopper no lado direito da tela
          Positioned(
            right: 20,
            bottom: 20,
            child: ValueListenableBuilder<String>(
              valueListenable: chopperImageNotifier,
              builder: (context, chopperImage, child) {
                return Image.asset(
                  chopperImage, // Usa a imagem atual do Chopper
                  width: 150,
                  height: 150,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
