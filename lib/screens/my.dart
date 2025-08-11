import 'package:animation/data/quistions.dart';
import 'package:animation/screens/quistions-screen.dart';
import 'package:animation/screens/results-screen.dart';
import 'package:animation/screens/start-screen.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<String> selectedAnswer = [];
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == quistions.length) {
      activescreen = ResultScreen(
        chossenAnswers: selectedAnswer,
        onRestart: switchscreen,
      );
      setState(() {});
    }
  }

  Widget? activescreen;
  @override
  void initState() {
    activescreen = StartScreen(switchscreen);
    super.initState();
  }

  void switchscreen() {
    selectedAnswer = [];
    activescreen = QuistionsScreen(onselectedAnswer: chooseAnswer);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: activescreen,
      ),
    );
  }
}
