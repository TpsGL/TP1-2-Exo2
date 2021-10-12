import 'package:exo2/bootstrap/QuestionModel.dart';
import 'package:exo2/bootstrap/QuizApp.dart';
import 'package:exo2/fragments/utils/Helper.dart';
import 'package:exo2/model/Question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MaterialApp(
    title: 'Programming Culture Quiz',
    debugShowCheckedModeBanner: false,
    home: StarterApp(),
  ));
}

class StarterApp extends StatelessWidget {
  const StarterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuestionModel())
      ],

      child: MaterialApp(
        routes: {"/": (context) => QuizFragment()},
      ),
    );
  }
}

class QuizFragment extends StatefulWidget{
  const QuizFragment({Key? key}) : super(key: key);

  @override
  _QuizFragmentState createState() => _QuizFragmentState();
}


class _QuizFragmentState extends State<QuizFragment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.blue, title: Text("Programming Culture Quiz")),
          body: SafeArea(
            child: Consumer<QuestionModel>(
                builder:(context, value, child) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 3,
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(
                                color: Colors.white,
                                  child: Image.asset( value.questions[value.questionIndex].srcImg),
                            )
                           )
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                                margin: EdgeInsets.all(14),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    value.questions[value.questionIndex].question,
                                    style: const TextStyle( fontSize: 20.0),
                                  ),
                                )
                            ),
                        ),

                        Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              if (value.questions[value.questionIndex].isCorrect == true) {
                                                ScaffoldMessenger.of(context).showSnackBar(Helper().correctAnswer());
                                              } else {
                                                ScaffoldMessenger.of(context).showSnackBar(Helper().incorrectAnswer());
                                              }
                                            });
                                          },
                                          child: Text("True")),
                                    )),
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (value.questions[value.questionIndex].isCorrect == false) {
                                              ScaffoldMessenger.of(context).showSnackBar(Helper().correctAnswer());
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(Helper().incorrectAnswer());
                                            }
                                          });
                                        },
                                        child: Text("False")
                                    )
                                ),
                                Expanded(child: Padding(

                                  padding: const EdgeInsets.all(5.0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        value.updateQuiz();
                                      },
                                      child: Icon( Icons.arrow_forward)
                                  ),
                                )
                                )
                              ],
                            )),
                      ],
                    ),
                  )
                 ;}
            )
          ),
        );
  }

}



