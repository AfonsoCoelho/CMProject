import 'package:flutter/material.dart';

class TransformationPage extends StatelessWidget {
  const TransformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transformações'),
        backgroundColor: const Color(0xFFFFC0CB),
      ),
      body: const Center(
        child: Text('Página das Transformações', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
