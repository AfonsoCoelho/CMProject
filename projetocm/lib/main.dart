import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tony Tony Chopper',
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
        backgroundColor: Color(0xFFFFC0CB), // Cor de fundo rosa bebê para a AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.store), // Ícone da loja
            onPressed: () {
              // Navegar para a página da loja
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LojaPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.inventory), // Ícone do inventário
            onPressed: () {
              // Navegar para a página do inventário
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InventarioPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person), // Ícone do perfil
            onPressed: () {
              // Navegar para a página do perfil
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.help_outline), // Ícone vazio (placeholder)
            onPressed: () {
              // Navegar para a página do jogo
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GamePage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_horiz), // Ícone vazio (placeholder)
            onPressed: () {
              // Navegar para a página do transformacao
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransformationPage()),
              );
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
          color: Color(0xFFFFC0CB), // Cor de fundo rosa bebê para o Footer
          alignment: Alignment.center,
          child: Text(
            'Tony Tony Chopper',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

// Página da Loja
class LojaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loja'),
        backgroundColor: Color(0xFFFFC0CB), // Cor de fundo rosa bebê para a AppBar
      ),
      body: Center(
        child: Text('Página da Loja', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

// Página do Inventário
class InventarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventário'),
        backgroundColor: Color(0xFFFFC0CB), // Cor de fundo rosa bebê para a AppBar
      ),
      body: Center(
        child: Text('Página do Inventário', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

// Página do Perfil
class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Color(0xFFFFC0CB), // Cor de fundo rosa bebê para a AppBar
      ),
      body: Center(
        child: Text('Página do Perfil', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}


// Página do mini-jogo
class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini-Jogo'),
        backgroundColor: Color(0xFFFFC0CB), // Cor de fundo rosa bebê para a AppBar
      ),
      body: Center(
        child: Text('Página do Mini-Jogo', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

// Página do Perfil
class TransformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transformações'),
        backgroundColor: Color(0xFFFFC0CB), // Cor de fundo rosa bebê para a AppBar
      ),
      body: Center(
        child: Text('Página das Transformações', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
