import 'package:calculator_add/screens/viewmodel/calculator_model.dart';
import 'package:calculator_add/screens/widgets/buttons_grid_list.dart';
import 'package:calculator_add/screens/widgets/entry_field_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  CalculatorAppState createState() => CalculatorAppState();

  static Widget create() => ChangeNotifierProvider(
        create: (_) => CalculatorViewModel(),
        lazy: false,
        child: const CalculatorApp(),
      );
}

class CalculatorAppState extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(flex: 1, child: EntryFieldWidget()),
            Flexible(flex: 3, child: ButtonsGridList()),
          ],
        ),
      ),
    );
  }
}