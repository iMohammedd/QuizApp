import 'package:animation/data/quistions.dart';
import 'package:animation/screens/component/qustionSammury.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chossenAnswers,
    required this.onRestart,
  });
  final List<String> chossenAnswers;
  final void Function() onRestart;
  List<Map<String, Object>> getSammuryData() {
    final List<Map<String, Object>> samury = [];
    for (var i = 0; i < chossenAnswers.length; i++) {
      samury.add({
        "qustionInex": i,
        "quistion": quistions[i].text,
        "answer": quistions[i].answers[0],
        "choosenAnswers": chossenAnswers[i],
      });
    }
    return samury;
  }

  @override
  Widget build(BuildContext context) {
    final correctAnswer = getSammuryData().where((data) {
      return data["choosenAnswers"] == data["answer"];
    }).length;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 160,
                width: 160,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: correctAnswer / 4,
                  color: Colors.green,
                  backgroundColor: Colors.white,
                ),
              ),
              Text(
                "${correctAnswer / 4 * 100}%",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            correctAnswer == 4
                ? ".رائع! إجابات ممتازة!"
                : correctAnswer == 2
                ? ".جيد جدًا! يمكنك المحاولة مرة أخرى"
                : ".لا بأس! المعرفة رحلة، حاول مرة أخرى لتتعلم أكثر",
            style: TextStyle(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 20),
          Qustionsammury(samData: getSammuryData()),
          SizedBox(height: 30),
          TextButton(
            onPressed: onRestart,
            child: Text(
              "إعادة الأختبار",
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
