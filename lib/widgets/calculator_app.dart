import 'package:calculator_add/theme/button_calculator.dart';
import 'package:calculator_add/widgets/calculator_,model.dart';
import 'package:flutter/material.dart';
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
          SizedBox(
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
          ),
         const Row(
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
          ),
          const SizedBox(height: 15),
          const   Row(
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
          ),
          const SizedBox(height: 15),
          const Row(
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
          ),
          const SizedBox(height: 15),
          const   Row(
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
                onPressed: () => model.onPressed(model.buttonTxtZero),
                child: Text(
                  model.buttonTxtZero,
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              const   ButtonCalculator(',', Colors.white24, Colors.white),
              const   ButtonCalculator('=', Colors.orange, Colors.white),
            ],
          ),
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
