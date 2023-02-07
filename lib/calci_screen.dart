import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calci extends StatefulWidget {
  const Calci({super.key});

  @override
  State<Calci> createState() => _CalciState();
}

class _CalciState extends State<Calci> {
  String userInput = '';
  String result = '';

  List<String> buttonList = [
    'AC',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'C',
    '0',
    '.',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 3),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  userInput,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerRight,
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Divider(color: Colors.white),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: buttonList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemBuilder: (BuildContext context, int index) {
                return CustomButton(buttonList[index]);
              },
            ),
          ))
        ],
      ),
    );
  }

  Widget CustomButton(String text) {
    return InkWell(
      splashColor: Colors.black,
      onTap: () {},
      child: Ink(
        decoration: BoxDecoration(
          color: getBgColor(text),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 0.5,
              offset: Offset(-3, -5),
            ),
          ],
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  color: getColor(text),
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  getColor(String text) {
    if (text == '/' ||
        text == '*' ||
        text == '+' ||
        text == '-' ||
        text == 'C' ||
        text == ')' ||
        text == '(') return Colors.orange;

    return Colors.white;
  }

  getBgColor(String text) {
    if (text == 'AC') {
      return Colors.red;
    }
    if (text == '=') {
      return Colors.greenAccent;
    }
    return Colors.black;
  }

  handleButtons(String text) {
    if (text == 'AC') {
      userInput = '';
      result = '0';
    }
    if (text == 'C') {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
        return;
      } else {
        return null;
      }
    }
    if (text == '=') {
      result = calculate();
      userInput = result;

      if (userInput.endsWith('.0')) {
        userInput = userInput.replaceAll('.0', '');
      }
      if (result.endsWith('.0')) {
        result = result.replaceAll('0', '');
        return;
      }
    }
    userInput = userInput + text;
  }

  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return 'Error';
    }
  }
}
