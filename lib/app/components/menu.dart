import 'package:flutter/material.dart';
import 'package:tres_telas_flutter/app/calculadora.dart';


import '../formulario.dart';
import '../home.dart';
import '../sobre.dart';



Widget Menu(BuildContext context){
  return Drawer(
    child:  ListView(
      //teste de comentario
      //padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),

      ListTile(
        title: const Text('Calculadora'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const calculadora()),
            );
          },
        ),
        ListTile(
          title: const Text('Sobre'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Sobre()),
            );
          },
        ),
        ListTile(
          title: const Text('Sair'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),

      ]),
  );
}