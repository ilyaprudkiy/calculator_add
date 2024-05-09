import 'package:calculator_add/screens/viewmodel/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EntryFieldWidget extends StatelessWidget {
  const EntryFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CalculatorViewModel>();
    final result = model.result;
    return GestureDetector(
      child: FittedBox(
        fit: BoxFit.fill,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            children: [
              Text(
                model.formatText(result),
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: result.length > 5 ? 60 : 100,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.end,
              )
            ],
          ),
        ),
      ),
    );
  }
}
