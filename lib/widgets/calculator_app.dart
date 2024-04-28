import 'package:calculator_add/theme/button_calculator.dart';
import 'package:calculator_add/widgets/calculator_,model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CalculatorViewModel>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          EntryFieldWidget(model: model),
          const OperandWidget(),
          const SizedBox(height: 15),
          const NumbersMenuOneWidget(),
          const SizedBox(height: 15),
          const NumbersMenuTwoWidget(),
          const SizedBox(height: 15),
          const NumbersMenuThreeWidget(),
          const SizedBox(height: 15),
          ButtonZeroAndResult(model: model),
        ],
      ),
    );
  }

  static Widget create() => ChangeNotifierProvider(
        create: (_) => CalculatorViewModel(),
        lazy: false,
        child: const CalculatorApp(),
      );
}

class ButtonZeroAndResult extends StatelessWidget {
  const ButtonZeroAndResult({
    super.key,
    required this.model,
  });

  final CalculatorViewModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
            shape: const StadiumBorder(),
            backgroundColor: Colors.white24,
          ),
          onPressed: () => model.onPressed(model.buttonTxtZero),
          child: Text(
            model.buttonTxtZero,
            style: const TextStyle(
              fontSize: 35,
              color: Colors.white,
            ),
          ),
        ),
        const ButtonCalculator(',', Colors.white24, Colors.white),
        const ButtonCalculator('=', Colors.orange, Colors.white),
      ],
    );
  }
}

class NumbersMenuThreeWidget extends StatelessWidget {
  const NumbersMenuThreeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonCalculator(
          '1',
          Colors.white24,
          Colors.white,
        ),
        ButtonCalculator(
          '2',
          Colors.white24,
          Colors.white,
        ),
        ButtonCalculator(
          '3',
          Colors.white24,
          Colors.white,
        ),
        ButtonCalculator(
          '+',
          Colors.orange,
          Colors.white,
        ),
      ],
    );
  }
}

class NumbersMenuTwoWidget extends StatelessWidget {
  const NumbersMenuTwoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonCalculator(
          '4',
          Colors.white24,
          Colors.white,
        ),
        ButtonCalculator(
          '5',
          Colors.white24,
          Colors.white,
        ),
        ButtonCalculator(
          '6',
          Colors.white24,
          Colors.white,
        ),
        ButtonCalculator(
          '-',
          Colors.orange,
          Colors.white,
        ),
      ],
    );
  }
}

class NumbersMenuOneWidget extends StatelessWidget {
  const NumbersMenuOneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonCalculator(
          '7',
          Colors.white24,
          Colors.white,
        ),
        ButtonCalculator(
          '8',
          Colors.white24,
          Colors.white,
        ),
        ButtonCalculator(
          '9',
          Colors.white24,
          Colors.white,
        ),
        ButtonCalculator(
          '*',
          Colors.orange,
          Colors.white,
        ),
      ],
    );
  }
}

class EntryFieldWidget extends StatelessWidget {
  const EntryFieldWidget({
    super.key,
    required this.model,
  });

  final CalculatorViewModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerRight,
        child: Text(
          model.output,
          textAlign: TextAlign.end,
          style: const TextStyle(color: Colors.white, fontSize: 100),
        ),
      ),
    );
  }
}

class OperandWidget extends StatelessWidget {
  const OperandWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonCalculator('AC', Colors.white70, Colors.black),
        ButtonCalculator('+/-', Colors.white70, Colors.black),
        ButtonCalculator(
          '%',
          Colors.white70,
          Colors.black,
        ),
        ButtonCalculator(
          '/',
          Colors.orange,
          Colors.white,
        ),
      ],
    );
  }
}
