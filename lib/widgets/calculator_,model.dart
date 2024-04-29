import 'package:flutter/cupertino.dart';

class CalculatorViewModel extends ChangeNotifier {
  String output = '0';
  String currentNumber = '';
  dynamic result = 0;
  final String buttonTxtZero = '0';

  Future<void> onPressed(String text) async {
    if (text == '=') {
      result = calculate();
      output = result.toString();
      currentNumber = output;
      notifyListeners();
    } else if (text == 'AC') {
      output = '0';
      currentNumber = '';
      result = 0;
      notifyListeners();
    } else if (text == '%') {
      int number = int.parse(currentNumber);
      double percentage = number / 100;
      output = percentage.toString();
      currentNumber = output;
      notifyListeners();
    } else if (text == '+/-') {
      if (currentNumber != '') {
        if (currentNumber.startsWith('-')) {
          currentNumber = currentNumber.substring(1);
        } else {
          currentNumber = '-$currentNumber';
        }
        output = currentNumber;
        notifyListeners();
      }
      notifyListeners();
    } else {
      currentNumber += text;
      output = currentNumber;
      notifyListeners();
    }
  }

  num? calculate() {
    final parts = currentNumber.split(RegExp(r'(\+|\-|\*|\/)'));
    var operandOne = double.parse(parts[0]);
    var operandTwo = double.parse(parts[1]);

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
          return null;
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
