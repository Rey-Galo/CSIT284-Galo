import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 72, 0, 144),
        iconTheme: IconThemeData(color: Colors.white70),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 72, 0, 144)),
        child: Center(
          child: Text(
            'Quiz Screen',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
