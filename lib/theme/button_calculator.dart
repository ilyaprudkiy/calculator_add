import 'package:calculator_add/widgets/calculator_,model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonCalculator extends StatelessWidget {
  const ButtonCalculator(
    this.btnTxt,
    this.btnColor,
    this.txtColor,
   {
    super.key,
  });

  final String btnTxt;
  final Color btnColor;
  final Color txtColor;


  @override
  Widget build(BuildContext context) {
    final model = context.read<CalculatorViewModel>();
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(80, 80), backgroundColor: btnColor,
          maximumSize: const Size(100, 100),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(10),
        ),
        onPressed: () => model.onPressed(btnTxt),
        child: Text(
          btnTxt,
          style: TextStyle(
            color: txtColor,
            fontSize: 35,
          ),
        ));
  }
}
