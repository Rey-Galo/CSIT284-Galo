
import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
 final randomizer = Random();
 var currentDiceImage = 'assets/dice-images/dice-3.png';
 void rollDice() {
   setState(() {
    var num = randomizer.nextInt(6) + 1;
     currentDiceImage = 'assets/dice-images/dice-$num.png';
   });
   }

  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(width: 200, currentDiceImage),
        SizedBox(height: 25),
        ElevatedButton(
          onPressed: rollDice,
          child: Text(style: TextStyle(fontSize: 15), "Roll Dice"),
        ),
      ],
    );
  }
}


