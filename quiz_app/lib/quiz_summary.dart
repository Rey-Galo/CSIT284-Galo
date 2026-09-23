import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'question.dart';
import 'quiz_screen.dart';

const Color backgroundColor = Color.fromARGB(255, 72, 0, 144);
const Color textColor = Color.fromARGB(255, 244, 243, 243);

class QuizSummary extends StatelessWidget {
  final List<int> chosenAnswers;

  const QuizSummary({super.key, required this.chosenAnswers});

  @override
  Widget build(BuildContext context) {
    int correctAnswersCount = 0;
    for (int i = 0; i < chosenAnswers.length; i++) {
      if (chosenAnswers[i] == questions[i].correctAnswerIndex) {
        correctAnswersCount++;
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'You answered $correctAnswersCount out of ${questions.length} questions correctly!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: chosenAnswers.asMap().entries.map((entry) {
                      int index = entry.key;
                      int chosenIndex = entry.value;
                      Question question = questions[index];
                      bool isCorrect =
                          chosenIndex == question.correctAnswerIndex;
                      String chosenAnswer = question.choices[chosenIndex];
                      String correctAnswer =
                          question.choices[question.correctAnswerIndex];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isCorrect
                                    ? const Color.fromARGB(255, 81, 254, 59)
                                    : const Color.fromARGB(255, 243, 94, 94),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    question.questionText,
                                    style: GoogleFonts.poppins(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    chosenAnswer,
                                    style: GoogleFonts.poppins(
                                      color: const Color.fromARGB(
                                        255,
                                        218,
                                        165,
                                        232,
                                      ),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    correctAnswer,
                                    style: GoogleFonts.poppins(
                                      color: const Color.fromARGB(
                                        255,
                                        140,
                                        215,
                                        245,
                                      ),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  score = 0;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 44, 0, 88),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                child: Text(
                  'Restart Quiz!',
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
