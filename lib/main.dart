import 'package:flutter/material.dart';
import 'quize_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: app_body(), // statefull widget which is holding all app code
          ),
        ),
      ),
    );
  }
}

class app_body extends StatefulWidget {
  const app_body({super.key});

  @override
  State<app_body> createState() => _app_bodyState();
}

class _app_bodyState extends State<app_body> {
//array to store icons

  List<Icon> score_Keeper = [];

//to check the answer is correct or not and add icons according to that

  void checkAnswer(bool userPickedAnswer) {
// checking if we are at last question if true then reset everything and show alert

    if (quizebrain.isFinished() == true) {
      Alert(
        style: AlertStyle(
          backgroundColor: Colors.tealAccent,
        ),
        context: context,
        title: 'Finished!',
        desc: 'You\'ve reached the end of the quiz.',
      ).show();

// resetting everything

      setState(() {
        score_Keeper = [];
        quizebrain.reset();
      });
    } else {
      setState(() {
        bool correctAnswer = quizebrain.getQuestionAnswer();
        if (correctAnswer == userPickedAnswer) {
          score_Keeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          score_Keeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizebrain.nextQuestion();
      });
    }
  }

  QuizeBrain quizebrain = QuizeBrain();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                quizebrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: TextButton(
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(180),
                  ),
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: TextButton(
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(180),
                  ),
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: score_Keeper,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
