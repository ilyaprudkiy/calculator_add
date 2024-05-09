import 'package:flutter/material.dart';

class CalculatorViewModel extends ChangeNotifier {
  String result = '0';

  String output = '';
  String currentNumber = '';
  String resultOperation = '';

  void onButtonPressed(String buttonText) {
    switch (buttonText) {
      case '+':
      case '-':
      case '*':
      case '/':
        if (output != '') {
          _calculate();
          notifyListeners();
        } else {
          output = currentNumber;
          notifyListeners();
        }
        currentNumber = '';
        resultOperation = buttonText;
        notifyListeners();
        break;
      case '+/-':
        currentNumber = convertStringToDouble(currentNumber) < 0
            ? currentNumber.replaceAll('-', '')
            : '-$currentNumber';
        result = currentNumber;
        notifyListeners();
        break;
      case '%':
        if (currentNumber == '') {
          return;
        } else {
          currentNumber =
              (convertStringToDouble(currentNumber) / 100).toString();
          result = currentNumber;
        }
        notifyListeners();
        break;
      case 'AC':
        _resetOperation();
        notifyListeners();
        break;
      case '=':
        _calculate();
        output = '';
        resultOperation = '';
        notifyListeners();
        break;
      case '.':
        if (!currentNumber.contains('.')) {
          currentNumber += '.';
          resultOperation = currentNumber;
          notifyListeners();
        }
        break;
      default:
        currentNumber = currentNumber += buttonText;
        result = currentNumber;
        notifyListeners();
    }
  }

  double convertStringToDouble(String number) {
    return double.tryParse(number) ?? 0;
  }

  void _resetOperation() {
    currentNumber = '';
    resultOperation = '';
    result = '0';
    output = '';
    notifyListeners();
  }

  void _calculate() {
    double _output = convertStringToDouble(output);
    double _currentNumber = convertStringToDouble(currentNumber);

    switch (resultOperation) {
      case '-':
        _output = _output - _currentNumber;
        break;
      case '+':
        _output = _output + _currentNumber;
        break;
      case '*':
        _output = _output * _currentNumber;
        break;
      case '/':
        _output = _output / _currentNumber;
        break;
      default:
        break;
    }
    currentNumber = (_output % 1 == 0 ? _output.toInt() : _output).toString();
    result = currentNumber;
    notifyListeners();
  }

  String formatText(String output) {
    String result = '';
    int count = 0;
    for (int i = output.length - 1; i >= 0 && count < 9; i--) {
      result = output[i] + result;
      count++;
      if (count % 3 == 0 && i > 0 && count < 9) {
        result = ' $result';
      }
    }
    return result;
  }
}
