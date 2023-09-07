import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/menu.dart';

class calculadora extends StatefulWidget {
  const calculadora({super.key});

  @override
  State<calculadora> createState() => _calculadoraState();
}

class _calculadoraState extends State<calculadora> {
  String _output = "0";
  String _currentNumber = "";
  String _operator = "";
  double _result = 0;

  void _onNumberPressed(String number) {
    setState(() {
      if (_currentNumber == "0") {
        _currentNumber = number;
      } else {
        _currentNumber += number;
      }
    });
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      if (_operator.isNotEmpty) {
        _calculate();
      }
      _operator = operator;
      _result = double.parse(_currentNumber);
      _currentNumber = "";
    });
  }

  void _onEqualsPressed() {
    setState(() {
      _calculate();
      _operator = "";
    });
  }

  void _calculate() {
    double num1 = _result;
    double num2 = double.parse(_currentNumber);

    switch (_operator) {
      case "+":
        _result = num1 + num2;
        break;
      case "-":
        _result = num1 - num2;
        break;
      case "*":
        _result = num1 * num2;
        break;
      case "/":
        _result = num1 / num2;
        break;
    }

    _currentNumber = _result.toString();
  }

  void _onClearPressed() {
    setState(() {
      _output = "0";
      _currentNumber = "";
      _operator = "";
      _result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
      Menu(context),
      appBar: AppBar(
        title: const Text('Cadastro Flutter'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu), // Ícone do menu
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abre o menu lateral
              },
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomRight,
            child: Text(
              _currentNumber.isEmpty ? "0" : _currentNumber,
              style: TextStyle(fontSize: 48),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton("7"),
              _buildButton("8"),
              _buildButton("9"),
              _buildOperatorButton("/"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton("4"),
              _buildButton("5"),
              _buildButton("6"),
              _buildOperatorButton("*"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton("1"),
              _buildButton("2"),
              _buildButton("3"),
              _buildOperatorButton("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton("0"),
              _buildButton("C"),
              _buildButton("="),
              _buildOperatorButton("+"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return ElevatedButton(
      onPressed: () {
        if (buttonText == "C") {
          _onClearPressed();
        } else if (buttonText == "=") {
          _onEqualsPressed();
        } else {
          _onNumberPressed(buttonText);
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // Cor de fundo do botão
        onPrimary: Colors.white, // Cor do texto do botão
        padding: EdgeInsets.all(20), // Espaçamento interno
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Borda arredondada
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildOperatorButton(String operator) {
    return ElevatedButton(
      onPressed: () {
        _onOperatorPressed(operator);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.orange, // Cor de fundo do botão
        onPrimary: Colors.white, // Cor do texto do botão
        padding: EdgeInsets.all(20), // Espaçamento interno
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Borda arredondada
        ),
      ),
      child: Text(
        operator,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
