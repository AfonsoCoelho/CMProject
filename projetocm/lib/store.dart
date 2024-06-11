import 'package:flutter/material.dart';

class LojaPage extends StatelessWidget {
  const LojaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja'),
        backgroundColor: const Color(0xFFFFC0CB), // Cor de fundo rosa bebê para a AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                      GridView.count(
                        crossAxisCount: 3, // Número de colunas
                        shrinkWrap: true, // Evita que o GridView ocupe mais espaço do que necessário
                        crossAxisSpacing: 10, // Espaçamento horizontal entre os botões
                        mainAxisSpacing: 10, // Espaçamento vertical entre os botões
                        physics: const NeverScrollableScrollPhysics(), // Desabilita a rolagem do GridView
                        children: List.generate(6, (index) {
                          return AspectRatio(
                            aspectRatio: 1, // Mantém os botões quadrados
                            child: TextButton(
                              onPressed: () {
                                // Lógica para comprar a roupa index + 1
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero, // Remove o padding interno
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), // Borda arredondada
                                  border: Border.all(color: Colors.transparent), // Sem borda visível
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/roupa${index + 1}.png', // Substitua pelo caminho das imagens de roupa
                                    fit: BoxFit.cover, // Ajusta a imagem para cobrir todo o botão
                                  ),
                                ),
                              ),
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
                    width: 600, // Ajuste conforme necessário
                    height: 600, // Ajuste conforme necessário
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
