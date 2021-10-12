


import 'package:flutter/material.dart';

class Helper {

  /**  **/
  SnackBar correctAnswer(){
    var textMessage = "The answer is correct";
    return SnackBar(content: Text(textMessage));
  }

  /**  **/
  SnackBar incorrectAnswer(){
    var textMessage = "Try again";
    return SnackBar(content: Text(textMessage));
  }
}