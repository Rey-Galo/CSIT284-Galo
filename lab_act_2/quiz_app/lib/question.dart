class Question {
  final String questionText;
  final List<String> choices;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.choices,
    required this.correctAnswerIndex,
  });
}

List<Question> questions = [
  Question(
    questionText: 'Which widget shows text on screen?',
    choices: ['Text', 'Label', 'Display', 'Word'],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: 'What does StatelessWidget mean?',
    choices: [
      'A widget with no memory of changing data',
      'A widget with a database',
      'A widget that never renders',
      'A widget only for images',
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: 'Which widget lets you stack children vertically?',
    choices: ['Column', 'Row', 'Stack', 'GridView'],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: 'Which widget lets you stack children horizontally?',
    choices: ['Row', 'Column', 'Stack', 'ListView'],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: 'What is Flutter\'s entry point function called?',
    choices: ['main()', 'start()', 'run()', 'init()'],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: 'Which widget CAN change what it shows over time?',
    choices: [
      'StatefulWidget',
      'StatelessWidget',
      'ChangeWidget',
      'LiveWidget',
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: 'Which widget wraps content to make it tappable with an onPressed action?',
    choices: ['ElevatedButton', 'TextField', 'Container', 'Image'],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: 'Which widget adds empty space between other widgets?',
    choices: ['SizedBox', 'Spacer', 'Padding', 'Gap'],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: 'Which widget centers its child on the screen?',
    choices: ['Center', 'Align', 'Middle', 'Focus'],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: 'Which widget is used to display an image from assets?',
    choices: ['Image.asset', 'Picture.load', 'AssetImage.show', 'Photo.get'],
    correctAnswerIndex: 0,
  ),
];
