import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}



class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'Start-Screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'Quiz-Screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'Result-Screen';
      });
    }
  }

  void restartQuiz (){
    selectedAnswer = [];
    setState(() {
      activeScreen = 'Start-Screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'Quiz-Screen'){
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if(activeScreen == 'Result-Screen'){
      screenWidget = ResultScreen(chosenAnswer: selectedAnswer,restartQuiz: restartQuiz, );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 73, 17, 152),
                Color.fromARGB(255, 41, 5, 92),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget
        ),
      ),
    );
  }
}
