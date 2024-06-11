import 'package:first_app/data/questions.dart';
import 'package:first_app/quiz_app/questions_screen.dart';
import 'package:first_app/quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = 'start-screen';
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestionsScreen(
            onSelectedAnswer: chooseAnswer,
          );
    //or
    // Widget screenWidget = StartScreen(switchScreen);
    // if (activeScreen == 'questions-screen') {
    //   screenWidget = const QuestionsScreen();
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.transparent,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.deepPurple,
              Color.fromARGB(255, 202, 63, 227),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: screenWidget),
      ),
    );
  }
}
