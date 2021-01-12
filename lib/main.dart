import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green.shade800,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.green.shade800,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 3;

  oneRandomDice(){
      leftDiceNumber = Random().nextInt(6) + 1;
  }
  twoRandomDices(){
    oneRandomDice();
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          // Right Dice
          Expanded(
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    oneRandomDice();
                  });
                },
                child: Image.asset('images/dice$leftDiceNumber.png')),
          ),
          SizedBox(
            width: 10,
          ),
          //Left Dice
          Expanded(
              child: FlatButton(
            onPressed: () {
              setState(() {
                twoRandomDices();
              });
            },
            child: Image.asset(
              'images/dice$rightDiceNumber.png',
            ),
          )),
        ],
      ),
    );
  }
}
