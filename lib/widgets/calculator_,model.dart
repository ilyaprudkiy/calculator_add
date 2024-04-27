import 'package:flutter/cupertino.dart';

class CalculatorViewModel extends ChangeNotifier {
  String output = '0';
  String currentNumber = '';
  double result = 0;
  final String buttonTxtZero = '0';

  Future<void> onPressed(String text) async {
    if (text == '=') {
      result = calculate();
      output = result.toString();
      currentNumber = '';
      notifyListeners();
    } else if (text == 'AC') {
      output = '0';
      currentNumber = '';
      result = 0;
      notifyListeners();
    } else {
      currentNumber += text;
      output = currentNumber;
      notifyListeners();
    }
  }

  double calculate() {
    final parts = currentNumber.split(RegExp(r'(\+|\-|\*|\/)'));
    final operandOne = double.parse(parts[0]);
    final operandTwo = double.parse(parts[1]);

    final operator = currentNumber.replaceAll(RegExp(r'[\d\.]'), '');

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

  String addSpaces(String output) {
    String result = '';
    int count = 0;

    for (int i = output.length - 1; i >= 0; i--) {
      result = output[i] + result;
      count++;

      if (count % 3 == 0 && i > 0) {
        result = ' $result';
      }
    }

    return result;
  }
}
