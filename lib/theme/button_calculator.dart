import 'package:calculator_add/widgets/calculator_,model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonCalculator extends StatelessWidget {
  const ButtonCalculator(
    this.btnTxt, {
    super.key,
  });

  final String btnTxt;

  @override
  Widget build(BuildContext context) {
    final model = context.read<CalculatorViewModel>();
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(80, 80),
          backgroundColor: Colors.white24,
          maximumSize: const Size(100, 100),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(10),
        ),
        onPressed: () => model.onPressed(btnTxt),
        child: Text(
          btnTxt,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ));
  }
}

class ButtonConversion extends StatelessWidget {
  const ButtonConversion(
    this.btnTxt, {
    super.key,
  });

  final String btnTxt;

  @override
  Widget build(BuildContext context) {
    final model = context.read<CalculatorViewModel>();
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(80, 80),
          backgroundColor: Colors.white70,
          maximumSize: const Size(100, 100),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(10),
        ),
        onPressed: () => model.onPressed(btnTxt),
        child: Text(
          btnTxt,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 35,
          ),
        ));
  }
}

class ButtonOperator extends StatelessWidget {
  const ButtonOperator(
    this.btnTxt, {
    super.key,
  });

  final String btnTxt;

  @override
  Widget build(BuildContext context) {
    final model = context.read<CalculatorViewModel>();
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(80, 80),
          backgroundColor: Colors.orange,
          maximumSize: const Size(100, 100),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(10),
        ),
        onPressed: () => model.onPressed(btnTxt),
        child: Text(
          btnTxt,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ));
  }
}
