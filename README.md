# Calculator Add (Flutter)

A calculator application built with Flutter using `Provider` and `ChangeNotifier` to separate UI and business logic.  
The app supports basic arithmetic operations and additional calculator features, with a dark UI inspired by standard smartphone calculators.

## Features

**Basic operations**
- addition
- subtraction
- multiplication
- division

**Extra functions**
- sign change (`+/-`)
- percentage calculation (`%`)
- clear all (`AC`)
- decimal input (`.`)

**Output formatting**
- limit of displayed number length
- digit grouping for better readability

**UI features**
- active operator highlighting
- adaptive result field
- dynamic font scaling

## Tech Stack

- Flutter
- Dart
- Provider / ChangeNotifier — state management
- StaggeredGridView — button layout

## Project Structure

- `lib/main.dart` — application entry point
- `lib/screens/calculator_screen/calculator_app.dart` — calculator screen
- `lib/screens/viewmodel/calculator_model.dart` — business logic and state
- `lib/screens/widgets/entry_field_widget.dart` — result display widget
- `lib/screens/widgets/buttons_grid_list.dart` — buttons grid
- `lib/data/data_buttons.dart` — button configuration and model

## Planned Improvements

**Testing**
- unit tests for `CalculatorViewModel`

**Feature extensions**
- additional mathematical operations
- calculation history

**UX improvements**
- button press animations
- haptic feedback
- UI localization

**Documentation**
- screenshots or GIF demonstrations

## How to Run

Make sure Flutter is installed, then run:
flutter pub get
flutter run