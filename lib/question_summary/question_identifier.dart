import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({super.key, required this.data});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    final isCorrect = data['user_answer'] == data['correct_answer'];
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isCorrect 
          ? const Color.fromARGB(255, 148, 52, 239) 
          : const Color.fromARGB(255, 189, 44, 170),
          borderRadius: BorderRadius.circular(50)),
      child: Text(((data['question_index'] as int) + 1).toString()),
    );
  }
}
