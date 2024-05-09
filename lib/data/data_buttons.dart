import 'package:flutter/material.dart';

class Button {
  final String value;
  final Color buttonColor;
  final Color textColor;


  Button(this.value, this.buttonColor, this.textColor, );
}

List<Button> buttons = [
  Button('AC', Colors.grey, Colors.white),
  Button('+/-', Colors.grey, Colors.white),
  Button('%', Colors.grey, Colors.white),
  Button('/', Colors.orange, Colors.white),
  Button('7', Colors.white24, Colors.white),
  Button('8', Colors.white24, Colors.white),
  Button('9', Colors.white24, Colors.white),
  Button('*', Colors.orange, Colors.white),
  Button('4', Colors.white24, Colors.white),
  Button('5', Colors.white24, Colors.white),
  Button('6', Colors.white24, Colors.white),
  Button('-', Colors.orange, Colors.white),
  Button('1', Colors.white24, Colors.white),
  Button('2', Colors.white24, Colors.white),
  Button('3', Colors.white24, Colors.white),
  Button('+', Colors.orange, Colors.white),
  Button('0', Colors.white24, Colors.white, ),
  Button('.', Colors.white24, Colors.white),
  Button('=', Colors.orange, Colors.white),
];
