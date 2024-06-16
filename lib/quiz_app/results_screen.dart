import 'package:first_app/data/questions.dart';
import 'package:first_app/quiz_app/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryAnswer() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question_name': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final numOfTotalQuestions = getSummaryAnswer().length;
    final numOfCorrectAnswers = getSummaryAnswer()
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  'You answerd $numOfCorrectAnswers of $numOfTotalQuestions questions correctly'),
              const SizedBox(height: 30),
              QuestionsSummary(summaryData: getSummaryAnswer()),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () {
                    return;
                  },
                  child: const Text('Restart Quiz'))
            ],
          )),
    );
  }
}
