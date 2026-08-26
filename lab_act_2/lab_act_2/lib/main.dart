import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 68, 255, 109),
              const Color.fromARGB(255, 64, 255, 107)
            ]) 
          ),
          child: Center(  
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Image.asset(
                  width: 200,
                  'assets/dice-images/dice-3.png'),
                  SizedBox(height: 25),
                 TextButton(onPressed: () {}, child: Text(
                  style: TextStyle(
                    fontSize: 28
                  ),
                  "Roll Dice"))
              ],
            ) 
          ),
        ),
      ),
    ),
  );
}
