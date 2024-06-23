import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final TextEditingController _nameController = TextEditingController();
  String _userEmail = "user@example.com"; // Simulação de email do usuário
  String _userName = "Nome do Usuário"; // Simulação de nome do usuário
  String _profileImage = 'assets/default.png'; // Caminho inicial para a imagem de perfil

  // Lista de imagens predefinidas
  final List<String> _predefinedImages = [
    'assets/luffy.png',
    'assets/zoro.png',
    'assets/nami.png',
    'assets/ussop.png', // Adicione mais caminhos conforme necessário
  ];

  // Método para salvar o novo nome
  void _saveName() {
    setState(() {
      _userName = _nameController.text;
    });
    Navigator.of(context).pop(); // Fecha o modal após salvar
  }

  // Método para exibir um diálogo de edição do nome
  void _editName() {
    _nameController.text = _userName; // Preenche o campo com o nome atual
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Nome'),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: 'Digite seu novo nome'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Fecha o modal sem salvar
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: _saveName,
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  // Método para exibir o diálogo de seleção de imagens predefinidas
  void _showImagePicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escolha uma Imagem de Perfil'),
          content: SizedBox(
            width: double.maxFinite,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Número de colunas
                crossAxisSpacing: 10, // Espaçamento horizontal
                mainAxisSpacing: 10, // Espaçamento vertical
              ),
              itemCount: _predefinedImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _profileImage = _predefinedImages[index];
                    });
                    Navigator.of(context).pop(); // Fecha o modal após a seleção
                  },
                  child: Image.asset(_predefinedImages[index]),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: const Color(0xFFFFC0CB),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navega para a página de configurações
              Navigator.pushNamed(context, '/settings'); // Substitua pelo caminho da sua página de opções
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Imagem de Perfil
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(_profileImage),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.white),
                      onPressed: _showImagePicker, // Chama o método para escolher uma imagem predefinida
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Nome do Usuário
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_userName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: _editName, // Chama o método para editar o nome
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Email do Usuário
            Text(_userEmail, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            // Botão para Acessar Opções
            ElevatedButton(
              onPressed: () {
                // Navega para a página de opções
                Navigator.pushNamed(context, '/settings'); // Substitua pelo caminho da sua página de opções
              },
              child: const Text('Opções da Aplicação'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//just incase