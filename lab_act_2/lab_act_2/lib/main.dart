import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueAccent,
              Colors.amberAccent
            ])
          ),
          child: Center(
            child: Text("Hello world"),
          ),
        ),
      ),
    ),
  );
}
