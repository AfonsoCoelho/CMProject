import 'package:flutter/material.dart';

class MiniJogoPage extends StatelessWidget {
  const MiniJogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini-Jogo'),
        backgroundColor: const Color(0xFFFFC0CB),
      ),
      body: const Center(
        child: Text('Página do Mini-Jogo', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
