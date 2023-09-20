import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({super.key, required this.answers, required this.falses});
  final int answers;
  final int falses;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
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
            Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.all(20),
              child: Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      'You got ${widget.answers} correct answers and ${widget.falses} incorrect answers',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.all(20),
              child: Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Restart'),
                  )),
            ),
          ],
        ));
  }
}
