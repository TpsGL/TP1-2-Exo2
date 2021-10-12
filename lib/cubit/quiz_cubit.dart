




import 'package:exo2/bootstrap/QuestionModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizCubic extends Cubit<int>{
  int questionIndex = 0;
  bool? etat;

  QuizCubic() : super(0);

  nextQuestion() {
    if (questionIndex < 8) {
      questionIndex++;
    } else {
      questionIndex = 0;
    }
    emit(questionIndex);
  }

  checkResponse(bool response) {

    if (response == QuestionModel().questions[questionIndex].isCorrect) {
      etat = true;
      nextQuestion();
    } else {
      etat = false;
    }
  }
}