import 'package:flutter/material.dart';

import 'question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
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
            questions[currentQuestionIndex].questionText,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
