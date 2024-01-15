import 'package:flutter/material.dart';
import 'package:quiz_app/question_summary/question_identifier.dart';
import 'package:quiz_app/question_summary/question_summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map(
          (data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionIdentifier(data: data),
                const SizedBox(width: 10,),
                QuestionSummaryItem(data: data),
              ],
            );
          },
        ).toList()),
      ),
    );
  }
}
