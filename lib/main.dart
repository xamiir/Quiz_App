import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<String> questions = [
  //   '1. flutter is a programming language',
  //   '2. flutter is a framework',
  //   '3. flutter is a dart framework',
  //   '4. react is a dart framework',
  //   '5. react backend is nodejs',
  // ];
  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  //   false,
  //   false,
  // ];
  List<Question> questions = [
    Question('1. flutter is a programming language', false),
    Question('2. flutter is a framework', true),
    Question('3. flutter is a dart framework', true),
    Question('4. react is a dart framework', false),
    Question('5. react backend is nodejs', false),
  ];
  int questionIndex = 0;
  int correctAnswers = 0;
  int incorrectAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          title: const Text('Quiz App'),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 5,
                child: Center(
                  child: Text(questions[questionIndex].questionText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      )),
                )),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 55,
                        margin: const EdgeInsets.only(
                            left: 22.0, right: 22.0, bottom: 22.0),
                        child: ElevatedButton(
                          onPressed: () {
                            final isCorrect =
                                questions[questionIndex].questionAnswer;
                            setState(() {
                              //all questions are answered
                              if (questionIndex < questions.length - 1) {
                                questionIndex++;
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result(
                                            answers: correctAnswers,
                                            falses: incorrectAnswers)));
                              }
                            });
                            if (isCorrect) {
                              print('correct');
                              setState(() {
                                correctAnswers++;
                              });
                            } else {
                              print('incorrect');
                              setState(() {
                                incorrectAnswers++;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text('True'),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 55,
                        margin: const EdgeInsets.only(
                            left: 22.0, right: 22.0, bottom: 22.0),
                        child: ElevatedButton(
                          onPressed: () {
                            final Correct =
                                questions[questionIndex].questionAnswer;
                            setState(() {
                              //all questions are answered
                              if (questionIndex < questions.length - 1) {
                                questionIndex++;
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result(
                                            answers: correctAnswers,
                                            falses: incorrectAnswers)));
                              }
                            });
                            if (Correct) {
                              print("Incorrect");

                              setState(() {
                                incorrectAnswers++;
                              });
                            } else {
                              print("Correct");
                              setState(() {
                                correctAnswers++;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text('False'),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
