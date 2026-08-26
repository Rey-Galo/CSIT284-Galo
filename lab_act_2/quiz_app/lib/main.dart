
import 'package:flutter/material.dart';

var bgImage = 'assets/logo.png';

void main () {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 72, 0, 144)
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(bgImage, width: 200,),
                SizedBox(height: 25),
                Text('Learn flutter the fun way!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 44, 0, 88),
                  ),
                   child: Text('Start Quiz',
                   style: TextStyle(
                    color: Colors.white
                   ),
                   )
                   ),
              ],
            )
          ),
        ),
      ),
    )
  );
}