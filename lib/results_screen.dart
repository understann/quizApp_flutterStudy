import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer, required this.restartQuiz});

  final List chosenAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }


  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numTotalCorrect = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You\'ve answered $numTotalCorrect out of $numTotalQuestion Questions correctly!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 230, 254),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            TextButton(onPressed: restartQuiz, child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh, color: Colors.white,),
                SizedBox(width: 10,),
                Text('Restart Quiz?',style: TextStyle(color: Colors.white),),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
