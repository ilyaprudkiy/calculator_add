import 'package:flutter/material.dart';

class ButtonCalculator extends StatelessWidget {
  const ButtonCalculator(
    this.btnTxt,
    this.btnColor,
    this.txtColor,
    this.onBtnClicked, {
    super.key,
  });

  final String btnTxt;
  final Color btnColor;
  final Color txtColor;
  final Function(String) onBtnClicked;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(80, 80), backgroundColor: btnColor,
          maximumSize: const Size(100, 100),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        onPressed: () => onBtnClicked(btnTxt),
        child: Text(
          btnTxt,
          style: TextStyle(
            color: txtColor,
            fontSize: 35,
          ),
        ));
  }
}
