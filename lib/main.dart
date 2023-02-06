import 'package:flutter/material.dart';

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
}

Widget CustomButton(String Text) {
  return InkWell(
    splashColor: Colors.black,
    onTap: () {},
    child: Ink(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
          ),
        ],
      ),
    ),
  );
}
