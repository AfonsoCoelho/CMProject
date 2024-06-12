import 'package:flutter/material.dart';

class LojaPage extends StatefulWidget {
  final double money; // Valor do dinheiro
  final Function(double) onPurchase; // Função para comprar itens

  const LojaPage({Key? key, required this.money, required this.onPurchase})
      : super(key: key);

  @override
  _LojaPageState createState() => _LojaPageState();
}

class _LojaPageState extends State<LojaPage> {
  List<String> roupasCompradas = []; // Lista de roupas compradas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja'),
        backgroundColor: const Color(0xFFFFC0CB), // Cor de fundo rosa bebê para a AppBar
        actions: [
          Row(
            children: [
              Text(
                '\$${widget.money}', // Exibe o valor do dinheiro
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
                          final itemPrice = 100.0;
                          final canBuy = widget.money >= itemPrice;
                          return SizedBox(
                            width: 100,
                            height: 150,
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: canBuy
                                      ? () {
                                          // Lógica para comprar a roupa index + 1
                                          setState(() {
                                            roupasCompradas.add('roupa${index + 1}.png');
                                            widget.onPurchase(itemPrice);
                                          });
                                        }
                                      : null,
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
                                  '\$$itemPrice', // Preço da roupa
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: canBuy ? Colors.black : Colors.grey,
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
                  child: Image.asset(
                    'assets/chopper1.png',
                    width: 300, // Ajuste conforme necessário
                    height: 300, // Ajuste conforme necessário
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
