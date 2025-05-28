import 'package:flutter/material.dart';

import '../Widgets/calculatorButton.dart';

class CalculatorAndroid extends StatefulWidget {
  const CalculatorAndroid({super.key});

  @override
  State<CalculatorAndroid> createState() => _CalculatorAndroidState();
}

class _CalculatorAndroidState extends State<CalculatorAndroid> {
  String input = '';
  String output = '';
  String operator = '';
  String history = '';
  double num1 = 0;
  bool shouldResetInput = false;

  String formatOutput(double value) {
    if (value == value.toInt()) {
      return value.toInt().toString();
    }
    else {
      return value.toString();
    }
  }

  void buttonPress(String value) {
    setState(() {
      if (value == 'C') {
        input = '';
        output = '';
        operator = '';
        history = '';
        num1 = 0;
        shouldResetInput = false;
      }
      else if (value == '=') {
        history = '';
        shouldResetInput = true;
      }
      else if (['+', '-', 'x', '÷'].contains(value)) {
        if (input.isEmpty && output.isEmpty) {
          return;
        }

        if (operator.isNotEmpty && input.isNotEmpty) {
          double num2 = double.tryParse(input) ?? 0;
          double result = 0;
          if (operator == '+') {
            result = num1 + num2;
          }
          if (operator == '-') {
            result = num1 - num2;
          }
          if (operator == 'x') {
            result = num1 * num2;
          }
          if (operator == '÷') {
            result = num2 != 0 ? num1 / num2 : double.nan;
          }

          output = result.isNaN ? 'Syntax Error' : formatOutput(result);
          num1 = result;
          input = '';
          history = '$output $value';
          operator = value;
          return;
        }

        if (output.isNotEmpty && input.isEmpty) {
          num1 = double.tryParse(output) ?? 0;
        }
        else {
          num1 = double.tryParse(input) ?? 0;
          input = '';
        }

        operator = value;
        history = '${formatOutput(num1)} $operator';
        output = formatOutput(num1);
      }
      else if (value == '%') {
        if (input.isNotEmpty && operator.isNotEmpty) {
          double percentage = double.tryParse(input) ?? 0;
          double result = 0;

          // Apply percentage relative to num1
          if (operator == '+' || operator == '-') {
            percentage = num1 * percentage / 100;
          }
          else if (operator == 'x' || operator == '÷') {
            percentage = percentage / 100;
          }

          input = formatOutput(percentage);

          // Update result preview based on operator
          if (operator == '+') {
            result = num1 + percentage;
          }
          if (operator == '-') {
            result = num1 - percentage;
          }
          if (operator == 'x') {
            result = num1 * percentage;
          }
          if (operator == '÷'){
            result = percentage != 0 ? num1 / percentage : double.nan;
          }

          output = result.isNaN ? 'Syntax Error' : formatOutput(result);
          history = '${formatOutput(num1)} $operator ${formatOutput(percentage)}';
          shouldResetInput = true;
        }
        else if (input.isNotEmpty) {
          // When there's no operator yet, just turn number into percent
          double num = double.tryParse(input) ?? 0;
          num = num / 100;
          input = formatOutput(num);
          output = input;
          history = input;
        }
      }

      else if (value == '.') {
        if (!input.contains('.')) {
          if (input.isEmpty) {
            input = '0.';
          }
          else {
            input += '.';
          }
        }
        history = operator.isNotEmpty
            ? '${formatOutput(num1)} $operator $input'
            : input;

        output = input;
      }
      else {
        if (shouldResetInput) {
          input = '';
          shouldResetInput = false;
        }

        input += value;

        if (operator.isNotEmpty) {
          history = '${formatOutput(num1)} $operator $input';
        }
        else {
          history = input;
        }

        if (operator.isNotEmpty && input.isNotEmpty) {
          double num2 = double.tryParse(input) ?? 0;
          double result = 0;
          if (operator == '+') {
            result = num1 + num2;
          }
          if (operator == '-') {
            result = num1 - num2;
          }
          if (operator == 'x') {
            result = num1 * num2;
          }
          if (operator == '÷') {
            result = num2 != 0 ? num1 / num2 : double.nan;
          }

          output = result.isNaN ? 'Syntax Error' : formatOutput(result);
        }
        else {
          output = input;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    history,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.orange.shade300,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    output,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreenAccent.shade200,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Buttons (same as before)
          Row(
            children: [
              calculatorButton(onClick: () => buttonPress('C'), text: 'C', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.red),
              calculatorButton(onClick: () => buttonPress('()'), text: '( )', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.lightGreenAccent.shade200),
              calculatorButton(onClick: () => buttonPress('%'), text: '%', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.lightGreenAccent.shade200),
              calculatorButton(onClick: () => buttonPress('÷'), text: '÷', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.lightGreenAccent.shade200),
            ],
          ),

          Row(
            children: [
              calculatorButton(onClick: () => buttonPress('7'), text: '7', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.orange.shade300),
              calculatorButton(onClick: () => buttonPress('8'), text: '8', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.orange.shade300),
              calculatorButton(onClick: () => buttonPress('9'), text: '9', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.orange.shade300),
              calculatorButton(onClick: () => buttonPress('x'), text: 'x', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.lightGreenAccent.shade200),
            ],
          ),

          Row(
            children: [
              calculatorButton(onClick: () => buttonPress('4'), text: '4', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.orange.shade300),
              calculatorButton(onClick: () => buttonPress('5'), text: '5', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.orange.shade300),
              calculatorButton(onClick: () => buttonPress('6'), text: '6', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.orange.shade300),
              calculatorButton(onClick: () => buttonPress('-'), text: '-', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.lightGreenAccent.shade200),
            ],
          ),

          Row(
            children: [
              calculatorButton(onClick: () => buttonPress('1'), text: '1', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.orange.shade300),
              calculatorButton(onClick: () => buttonPress('2'), text: '2', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.orange.shade300),
              calculatorButton(onClick: () => buttonPress('3'), text: '3', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.orange.shade300),
              calculatorButton(onClick: () => buttonPress('+'), text: '+', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.lightGreenAccent.shade200),
            ],
          ),

          Row(
            children: [
              calculatorButton(onClick: () => buttonPress('+/-'), text: '+/-', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.orange.shade300),
              calculatorButton(onClick: () => buttonPress('0'), text: '0', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.orange.shade300),
              calculatorButton(onClick: () => buttonPress('.'), text: '.', buttonColor: Colors.amber.withOpacity(0.1), fontColor: Colors.orange.shade300),
              calculatorButton(onClick: () => buttonPress('='), text: '=', buttonColor: Colors.lightGreen.shade700, fontColor: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
