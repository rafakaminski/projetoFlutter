import 'package:flutter/material.dart';
import 'components/menu.dart';

class Sobre extends StatefulWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Tela"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu), // Ícone do menu
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abre o menu lateral
              },
            );
          },
        ),
      ),
      drawer: Menu(context), // Conteúdo do menu lateral
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bem vindo:',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              width: 200,
              height: 200,
              child: Image(
                image: AssetImage('images/peixem.png'),
                fit: BoxFit.contain, // ou outra opção de ajuste desejada
              ),
            ),
          ],
        ),
      ),
    );
  }
}