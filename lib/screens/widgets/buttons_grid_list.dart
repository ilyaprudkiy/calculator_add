import 'package:calculator_add/data/data_buttons.dart';
import 'package:calculator_add/screens/viewmodel/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ButtonsGridList extends StatelessWidget {
  const ButtonsGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return  StaggeredGridView.countBuilder(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      itemCount: buttons.length,
      itemBuilder: (BuildContext context, int index) {
        final button = buttons[index];
        return _buildButton(
          context,
          button,
          index,
        );
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.count(buttons[index].value == '0' ? 2 : 1, 1);
      },
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }

  Widget _buildButton(BuildContext context, Button button, int index) {
    final model = context.watch<CalculatorViewModel>();
    final resultOperation = model.resultOperation;
    final currentNumber = model.currentNumber;
    return GestureDetector(
      onTap: () => model.onButtonPressed(button.value),
      child: Container(
        alignment:
        button.value == '0' ? Alignment.centerLeft : Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: button.value == resultOperation && currentNumber == ''
                ? Colors.white
                : button.buttonColor),
        child: Padding(
          padding: button.value == '0'
              ? const EdgeInsets.only(left: 20)
              : EdgeInsets.zero,
          child: Text(
            button.value,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: button.value == resultOperation && currentNumber == ''
                  ? Colors.orange
                  : button.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
