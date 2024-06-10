import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tony Chopper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tony Tony Chopper'),
        backgroundColor: Color(0xFFFFC0CB), // Cor de fundo rosa bebê
        actions: [
          IconButton(
            icon: Icon(Icons.home), // Ícone de exemplo, pode ser substituído
            onPressed: () {
              // Ação vazia
            },
          ),
          IconButton(
            icon: Icon(Icons.search), // Ícone de exemplo, pode ser substituído
            onPressed: () {
              // Ação vazia
            },
          ),
          IconButton(
            icon: Icon(Icons.settings), // Ícone de exemplo, pode ser substituído
            onPressed: () {
              // Ação vazia
            },
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          'assets/splash.png', // Caminho da imagem
          fit: BoxFit.cover, // Ajusta a imagem ao tamanho do widget
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            'Tony Chopper',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
