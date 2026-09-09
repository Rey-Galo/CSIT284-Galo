import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

const Color backgroundColor = Color.fromARGB(255, 72, 0, 144);
const Color buttonColor = Color.fromARGB(255, 44, 0, 88);
const Color textColor = Color.fromARGB(255, 244, 243, 243);

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: textColor),
      ),
      body: Container(
        decoration: BoxDecoration(color: backgroundColor),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                questions[currentQuestionIndex].questionText,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
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
                          backgroundColor: isCorrect
                              ? Colors.green
                              : const Color.fromARGB(255, 236, 81, 69),

                          content: Text(isCorrect ? 'Correct!' : 'Wrong!'),
                          duration: Duration(milliseconds: 700),
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 25,
                      ),
                      textStyle: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      minimumSize: Size(double.infinity, 80),
                    ),

                    child: Text(choice, style: TextStyle(color: textColor)),
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
