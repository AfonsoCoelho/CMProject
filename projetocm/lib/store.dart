import 'package:flutter/material.dart';
import 'main.dart';

class LojaPage extends StatelessWidget {
  final Function(int) onPurchase; // Função para comprar itens
  final List<int> roupasCompradas; // Lista de roupas compradas

  const LojaPage({
    Key? key,
    required this.onPurchase,
    required this.roupasCompradas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja'),
        backgroundColor: const Color(0xFFFFC0CB), // Cor de fundo rosa bebê para a AppBar
        actions: [
          ValueListenableBuilder<double>(
            valueListenable: moneyNotifier,
            builder: (context, money, child) {
              return Row(
                children: [
                  Text(
                    '\$$money', // Exibe o valor do dinheiro
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container ao redor do texto
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC0CB), // Cor de fundo rosa bebê
                          borderRadius: BorderRadius.circular(10), // Borda arredondada
                        ),
                        child: const Text(
                          'Escolha a roupa para o Chopper:',
                          style: TextStyle(
                            fontSize: 20, // Tamanho do texto menor para caber melhor
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
                        children: List.generate(6, (index) {
                          return SizedBox(
                            width: 100,
                            height: 150,
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: (moneyNotifier.value >= 100 &&
                                          !roupasCompradas.contains(index))
                                      ? () {
                                          moneyNotifier.value -= 100; // Deduz o valor da compra do dinheiro global
                                          onPurchase(index); // Chama a função de compra
                                          chopperImageNotifier.value =
                                              'assets/roupa${index + 1}.png'; // Atualiza a imagem do Chopper na loja
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Roupa comprada com sucesso!'),
                                              duration: Duration(seconds: 1),
                                            ),
                                          );
                                        }
                                      : null, // Desabilita o botão se a roupa já foi comprada ou o dinheiro for insuficiente
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
                                const SizedBox(height: 5), // Espaço entre o botão e o texto do preço
                                const Text(
                                  '\$100', // Preço da roupa
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
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
