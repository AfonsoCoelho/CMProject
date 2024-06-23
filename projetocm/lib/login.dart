import 'package:flutter/material.dart';
import 'package:projetocm/autenticacao.dart';
import 'main.dart'; // Importe sua página principal ou a tela que você deseja mostrar após o login

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Autenticacao autenticacao = Autenticacao();

  void _login() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;

      // Simulação de autenticação ou uso da sua lógica de autenticação aqui
      autenticacao.registarUser(name: name, email: email, password: password);

      // Navega para a página principal
      Navigator.pushReplacementNamed(context, '/home'); // Navega para a página principal definida em main.dart
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login em Tony Chopper'),
        backgroundColor: const Color(0xFFFFC0CB),
      ),
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'), // Caminho da imagem de fundo
                fit: BoxFit.cover, // Ajusta a imagem para cobrir todo o fundo
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Imagem do Chopper
                      Image.asset(
                        'assets/chopper.png', // Substitua pelo caminho da imagem do Chopper
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(height: 20),
                      // Campo de Nome
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          filled: true, // Ativa o preenchimento da cor de fundo
                          fillColor: Colors.white, // Cor de fundo branca
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu nome';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Campo de Email
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          filled: true, // Ativa o preenchimento da cor de fundo
                          fillColor: Colors.white, // Cor de fundo branca
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          }
                          // Regex básico para verificar formato de email
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Por favor, insira um email válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Campo de Senha
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          filled: true, // Ativa o preenchimento da cor de fundo
                          fillColor: Colors.white, // Cor de fundo branca
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Botão de Login
                      ElevatedButton(
                        onPressed: _login,
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
