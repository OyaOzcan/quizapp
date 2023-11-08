import 'package:flutter/material.dart';
import 'package:quizapp/finish_screen.dart';
import 'package:quizapp/data/question.dart';


bool checkAnswer(String selectedAnswer, String correctAnswer) {
  return selectedAnswer == correctAnswer;
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int i = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  List<bool> isCorrectAnswers = [];

  
  void changeAndCheckQuestion(String selectedAnswer) {
    
    if(checkAnswer(selectedAnswer, questions[i].correctAnswer))
      {
         correctAnswers++;
         isCorrectAnswers.add(true);
         }
   else 
    {
      wrongAnswers++;
      isCorrectAnswers.add(false);
    }

    if (i < questions.length - 1) {
      setState(() {
       i++;
      });
    }
    else {
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FinishScreen(
        correctAnswers: correctAnswers,
        wrongAnswers: wrongAnswers,
         isCorrectAnswers: isCorrectAnswers,
      ),
    ),
  );
}
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[i].question),
            ...questions[i].answers.map((answer) {
              return ElevatedButton(
                onPressed: () {
                  changeAndCheckQuestion(answer);
                },
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}