import 'package:flutter/material.dart';


import 'home.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();
  bool dadosExibidos = false;

  String retornoNome = "";
  String retornoEmail = "";
  String retornoSenha = "";

  void _enviar() {
    setState(() {
      retornoNome = name.text;
      retornoEmail = email.text;
      retornoSenha = senha.text;
      dadosExibidos = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Nome'),
                keyboardType: TextInputType.name,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: senha,
                decoration: const InputDecoration(labelText: 'Senha'),
                keyboardType: TextInputType.text,
              ),
              TextButton(
                onPressed: () {
                  _enviar();
                },
                child: Text('Cadastrar'),
              ),
              if (dadosExibidos)
                Column(
                  children: [
                    Text(
                      'Nome: $retornoNome',
                    ),
                    Text(
                      'Email: $retornoEmail',
                    ),
                    Text(
                      'Senha: $retornoSenha',
                    ),
                  ],
                ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
                child: Text('Voltar para Login'),
              ),
            ],
          ),
        ),
      ),
     // Conteúdo do menu lateral
    );
  }
}
