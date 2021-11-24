import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Dicee',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
                letterSpacing: 2,
              ),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 5;
  int rightDiceNum = 5;
  int sum = 10;
  void diceChange() {
    setState(() {
      rightDiceNum = Random().nextInt(6) + 1;
      leftDiceNum = Random().nextInt(6) + 1;
      sum = leftDiceNum + rightDiceNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: diceChange,
                    child: Image(
                      image: AssetImage('images/dice$leftDiceNum.png'),
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: diceChange,
                    child: Image(
                      image: AssetImage('images/dice$rightDiceNum.png'),
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(
            'Total output is $sum',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              letterSpacing: 2,
            ),
          ),
          FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: diceChange,
            backgroundColor: Colors.black,
          )
        ],
      ),
    );
  }
}
