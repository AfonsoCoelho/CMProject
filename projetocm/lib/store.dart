import 'package:flutter/material.dart';

class LojaPage extends StatelessWidget {
  const LojaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja'),
        backgroundColor: const Color(0xFFFFC0CB), // Cor de fundo rosa bebê para a AppBar
        leading: IconButton( // Botão para voltar à página anterior (neste caso, a página inicial)
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container( // Container rosa bebê em torno do texto
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC0CB), // Cor de fundo rosa bebê
                          borderRadius: BorderRadius.circular(10), // Borda arredondada
                        ),
                        child: Text(
                          'Escolha a roupa para o Chopper:',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Lógica para comprar a primeira roupa
                        },
                        child: Text('Roupa 1'), // Texto do botão
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Lógica para comprar a segunda roupa
                        },
                        child: Text('Roupa 2'), // Texto do botão
                      ),
                    ],
                  ),
                ),
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
