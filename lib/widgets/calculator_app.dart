import 'package:calculator_add/widgets/calculator_,model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:calculator_add/theme/button_calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  CalculatorAppState createState() => CalculatorAppState();

  static Widget create() => ChangeNotifierProvider(
        create: (_) => CalculatorViewModel(),
        child: CalculatorApp(),
        lazy: false,
      );
}

class CalculatorAppState extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<CalculatorViewModel>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                EntryFieldWidget(model: model),
                Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: _onButtonsGrid(),
                    )),
              ])),
    );
  }

  Widget _onButtonsGrid() {
    return Expanded(
        child: Container(
      width: 355,
      height: 100,
      child: StaggeredGridView.countBuilder(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        itemCount: buttons.length,
        itemBuilder: (BuildContext context, int index) {
          final button = buttons[index];
          return _buildButton(
            button,
            index,
          );
        },
        staggeredTileBuilder: (int index) {
          return StaggeredTile.count(buttons[index].value == '0' ? 2 : 1, 1);
        },
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
    ));
  }

  Widget _buildButton(Button button, int index) {
    final model = context.watch<CalculatorViewModel>();
    final resultOperation = model.resultOperation;
    final currentNumber = model.currentNumber;
    return GestureDetector(
      onTap: () => model.onButtonPressed(button.value),
      child: Container(
        width: MediaQuery.of(context).size.width / 4 * (buttons[index].value == '0' ? 2 : 1),
        alignment: button.value == '0' ? Alignment.centerLeft : Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: button.value == resultOperation && currentNumber == ''
                ? Colors.white
                : button.buttonColor),
        child: Padding( padding:  button.value == '0' ? const  EdgeInsets.only(left: 20) : EdgeInsets.zero,
          child: Text(
            button.value,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: button.value == resultOperation &&
                      currentNumber == ''
                  ? Colors.orange
                  : button.textColor,
            ),
          ),
        ),
      ),
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
    final result = model.result;
    return GestureDetector(
        child: FittedBox(
            fit: BoxFit.fill,
            child: SizedBox(
                height: 110,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            maxLines: 1,
                            model.formatText(result),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: result.length > 5 ? 60 : 100,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.end,
                          )
                        ])))));
  }
}
