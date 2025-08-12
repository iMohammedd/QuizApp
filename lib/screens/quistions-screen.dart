import 'dart:ui';

import 'package:animation/screens/component/answerbutton.dart';
import 'package:animation/data/quistions.dart';
import 'package:animation/screens/my.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class QuistionsScreen extends StatefulWidget {
  const QuistionsScreen({super.key, required this.onselectedAnswer});
  // ignore: non_constant_identifier_names
  final void Function(String Answer) onselectedAnswer;
  @override
  // ignore: library_private_types_in_public_api
  _QuistionsScreenState createState() => _QuistionsScreenState();
}

class _QuistionsScreenState extends State<QuistionsScreen> {
  var currentquistionindex = 0;

  void answerQuistion(String answer) {
    currentquistionindex++;
    widget.onselectedAnswer(answer);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentquistion = quistions[currentquistionindex];
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 120),

          FittedBox(
            child: Text(
              currentquistion.text,
              style: TextStyle(color: Colors.white, fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
          // ignore: deprecated_member_use
          Divider(color: Colors.white.withOpacity(0.3)),
          SizedBox(height: 30),
          ...currentquistion.getsuffledAnswers().map((answer) {
            return AnswerButton(
              ontap: () {
                answerQuistion(answer);
              },
              text: answer,
            );
          }),
          SizedBox(height: 20),

          SizedBox(height: 10),
          Container(
            height: 100,
            child: Lottie.asset(
              "assets/animations/question.json",
              fit: BoxFit.scaleDown,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyWidget();
                  },
                ),
                (route) => false,
              );
            },
            child: Text(
              "القائمة الرئيسية",
              style: TextStyle(
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.6),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
