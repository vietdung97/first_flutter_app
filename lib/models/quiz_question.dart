class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffedAnswers() {
    final List<String> shuffledAnswers = List<String>.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
