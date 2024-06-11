import 'package:flutter/material.dart';

class InventarioPage extends StatelessWidget {
  const InventarioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventário'),
        backgroundColor: const Color(0xFFFFC0CB),
      ),
      body: const Center(
        child: Text('Página do Inventário', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
