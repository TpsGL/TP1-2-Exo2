

import 'package:exo2/model/Question.dart';
import 'package:flutter/material.dart';

class QuestionModel extends ChangeNotifier {
  int questionIndex = 0;
  final List<Question> questions = [
    Question("Is inside <js> HTML tag do we put the JavaScript ?", false, "assets_dev/js.png"),
    Question("Is Laravel support MVC Architecture ?", true, "assets_dev/laravel-featured.png"),
    Question("If expression is not passed than default value is true in expression switch statement in Go", true, "assets_dev/go.png"),
    Question("Is Angular created By Microsoft ?", false, "assets_dev/angular.png"),
    Question("Is GWT SDK support MVP style Architecture ?", true, "assets_dev/gwt.png"),
  ];



  void updateQuiz(){
    if (questionIndex != questions.length - 1) {
      questionIndex++;
    } else {
      questionIndex = 0;
    }
    notifyListeners();
  }
}