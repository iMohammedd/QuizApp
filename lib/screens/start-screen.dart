import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset("assets/animations/quiz.json"),
          SizedBox(height: 10),
          Text(
            "المعرفة قوة... فهل أنت مستعد؟",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          SizedBox(height: 20),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 16),
              shape: BeveledRectangleBorder(),
            ),
            onPressed: startQuiz,
            child: Text("أختبر نفسك الآن"),
          ),
        ],
      ),
    );
  }
}
