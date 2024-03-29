import 'package:calculator_add/widgets/button_calculator.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String _output = '0';
  String _currentNumber = '';
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

    final operator = _currentNumber.replaceAll(RegExp(r'[\d\.]'), '');

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

  String addSpaces(String _output) {
    String result = '';
    int count = 0;

    for (int i = _output.length - 1; i >= 0; i--) {
      result = _output[i] + result;
      count++;

      if (count % 3 == 0 && i > 0) {
        result = ' $result';
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(
                _output,
                textAlign: TextAlign.end,
                style: const TextStyle(color: Colors.white, fontSize: 100),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonCalculator('AC', Colors.white70, Colors.black, _onPressed),
              ButtonCalculator('+/-', Colors.white70, Colors.black, _onPressed),
              ButtonCalculator('%', Colors.white70, Colors.black, _onPressed),
              ButtonCalculator('/', Colors.orange, Colors.white, _onPressed),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonCalculator('7', Colors.white24, Colors.white, _onPressed),
              ButtonCalculator('8', Colors.white24, Colors.white, _onPressed),
              ButtonCalculator('9', Colors.white24, Colors.white, _onPressed),
              ButtonCalculator('*', Colors.orange, Colors.white, _onPressed),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonCalculator('4', Colors.white24, Colors.white, _onPressed),
              ButtonCalculator('5', Colors.white24, Colors.white, _onPressed),
              ButtonCalculator('6', Colors.white24, Colors.white, _onPressed),
              ButtonCalculator('-', Colors.orange, Colors.white, _onPressed),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonCalculator('1', Colors.white24, Colors.white, _onPressed),
              ButtonCalculator('2', Colors.white24, Colors.white, _onPressed),
              ButtonCalculator('3', Colors.white24, Colors.white, _onPressed),
              ButtonCalculator('+', Colors.orange, Colors.white, _onPressed),
            ],
          ),
          const SizedBox(height: 15),
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
              ButtonCalculator(',', Colors.white24, Colors.white, _onPressed),
              ButtonCalculator('=', Colors.orange, Colors.white, _onPressed),
            ],
          ),
        ],
      ),
    );
  }
}
