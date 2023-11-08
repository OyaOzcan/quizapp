
import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;
  final List<bool> isCorrectAnswers;

  const FinishScreen({
    Key? key,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.isCorrectAnswers,
  }) : super(key: key);

  final int totalQuestions = 6;

  int calculateScore() {
    return ((correctAnswers / totalQuestions) * 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    int score = calculateScore();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 172, 233),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Color.fromARGB(255, 193, 178, 235),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInfoBox(
                'Puan: $score\n Doğru Cevap: $correctAnswers\n Yanlış Cevap: $wrongAnswers',
                Colors.white,
                25, // Font size
              ),
              for (var i = 0; i < isCorrectAnswers.length; i++)
                _buildInfoRow(
                  isCorrectAnswers[i] ? Icons.check_circle : Icons.cancel,
                  '${i + 1}. Soruya ${isCorrectAnswers[i] ? 'doğru' : 'yanlış'} cevap verdiniz.',
                  isCorrectAnswers[i] ? Colors.green : Colors.red,
                  20, // Font size
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String text, Color textColor, double fontSize) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: textColor),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, Color iconColor, double fontSize) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
