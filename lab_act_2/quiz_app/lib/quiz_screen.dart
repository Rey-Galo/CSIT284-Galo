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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                questions[currentQuestionIndex].questionText,
                style: TextStyle(color: Colors.white, fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ...questions[currentQuestionIndex].choices.asMap().entries.map((
                entry,
              ) {
                int choiceIndex = entry.key;
                String choice = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      bool isCorrect =
                          choiceIndex ==
                          questions[currentQuestionIndex].correctAnswerIndex;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(isCorrect ? 'Correct!' : 'Wrong!'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      setState(() {
                        if (currentQuestionIndex < questions.length - 1) {
                          currentQuestionIndex++;
                        } else {
                          currentQuestionIndex = 0;
                        }
                      });
                    },
                    child: Text(choice),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
