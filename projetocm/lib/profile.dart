import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: const Color(0xFFFFC0CB),
      ),
      body: const Center(
        child: Text('Página do Perfil', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
