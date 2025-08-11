class Quizquistions {
  const Quizquistions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getsuffledAnswers() {
    final suffledList = List.of(answers);
    suffledList.shuffle();

    return suffledList;
  }
}
