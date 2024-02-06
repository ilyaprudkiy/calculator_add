import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String _output = '0';
  String _currentNumber = '0';
  double _result = 0;
  final String buttonTxtZero = '0';

  void _onPressed(String text) {
    setState(() {
      if (text == '=') {
        _result = _calculate();
        _output = _result.toString();
        _currentNumber = '';
      } else if (text == 'AC') {
        _output = '0';
        _currentNumber = '';
        _result = 0;
      } else {
        _currentNumber += text;
        _output = _currentNumber;
      }
    });
  }

  double _calculate() {
    final parts = _currentNumber.split(RegExp(r'(\+|\-|\*|\/)'));
    final operandOne = double.parse(parts[0]);
    final operandTwo = double.parse(parts[1]);

    final operator = _currentNumber.replaceAll(RegExp(r'(\d|\.|\-)'), '');

    switch (operator) {
      case '+':
        return operandOne + operandTwo;
      case '-':
        return operandOne - operandTwo;
      case '*':
        return operandOne * operandTwo;
      case '/':
        if (operandOne != 0 && operandTwo != 0) {
          return operandOne / operandTwo;
        } else {
          return double.infinity;
        }
      default:
        return 0.0;
    }
  }

  Widget ButtonCalculator(String butontxt, Color buttoncolor, Color txtcolor) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(80, 80),
          maximumSize: const Size(100, 100),
          primary: buttoncolor,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        onPressed: () => _onPressed(butontxt),
        child: Text(
          butontxt,
          style: TextStyle(
            color: txtcolor,
            fontSize: 35,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    _output,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 100, color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonCalculator('AC', Colors.white70, Colors.black),
                ButtonCalculator('+/-', Colors.white70, Colors.black),
                ButtonCalculator('%', Colors.white70, Colors.black),
                ButtonCalculator('/', Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonCalculator('7', Colors.white24, Colors.white),
                ButtonCalculator('8', Colors.white24, Colors.white),
                ButtonCalculator('9', Colors.white24, Colors.white),
                ButtonCalculator('*', Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonCalculator('4', Colors.white24, Colors.white),
                ButtonCalculator('5', Colors.white24, Colors.white),
                ButtonCalculator('6', Colors.white24, Colors.white),
                ButtonCalculator('-', Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonCalculator('1', Colors.white24, Colors.white),
                ButtonCalculator('2', Colors.white24, Colors.white),
                ButtonCalculator('3', Colors.white24, Colors.white),
                ButtonCalculator('+', Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.white24,
                  ),
                  onPressed: () => _onPressed(buttonTxtZero),
                  child: Text(
                    buttonTxtZero,
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                ButtonCalculator(',', Colors.white24, Colors.white),
                ButtonCalculator('=', Colors.orange, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
