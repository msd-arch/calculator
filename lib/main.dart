import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String display = '0';
  double num1 = 0;
  double num2 = 0;
  String operation = '';

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        display = '0';
        num1 = 0;
        num2 = 0;
        operation = '';
      } else if (buttonText == 'D') {
        display = display.length == 1 ? '0' : display.substring(0, display.length - 1);
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
        num1 = double.parse(display);
        operation = buttonText;
        display = '0';
      } else if (buttonText == '=') {
        num2 = double.parse(display);
        switch (operation) {
          case '+':
            display = (num1 + num2).toString();
            break;
          case '-':
            display = (num1 - num2).toString();
            break;
          case '*':
            display = (num1 * num2).toString();
            break;
          case '/':
            display = num2 == 0 ? 'Error' : (num1 / num2).toString();
            break;
          default:
            display = '0';
            break;
        }
        num1 = 0;
        num2 = 0;
        operation = '';
      } else {
        display = display == '0' ? buttonText : display + buttonText;
      }
    });
  }

  Widget buildButton(String buttonText, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
              child: Text(
                display,
                style: TextStyle(fontSize: 48.0),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton('D', Colors.grey),
                  buildButton('C', Colors.grey),
                  buildButton('%', Colors.orange),
                  buildButton('/', Colors.orange),
                ],
              ),
              Row(
                children: [
                  buildButton('7', Colors.black54),
                  buildButton('8', Colors.black54),
                  buildButton('9', Colors.black54),
                  buildButton('*', Colors.orange),
                ],
              ),
              Row(
                children: [
                  buildButton('4', Colors.black54),
                  buildButton('5', Colors.black54),
                  buildButton('6', Colors.black54),
                  buildButton('-', Colors.orange),
                ],
              ),
              Row(
                children: [
                  buildButton('1', Colors.black54),
                  buildButton('2', Colors.black54),
                  buildButton('3', Colors.black54),
                  buildButton('+', Colors.orange),
                ],
              ),
              Row(
                children: [
                  buildButton('0', Colors.black54),
                  buildButton('.', Colors.black54),
                  buildButton('=', Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
