// ignore_for_file: deprecated_member_use

import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text('Quizzlet App'),
          ),
          body: QuizzlerPage(),
        ),
      ),
    ),
  );
}

class QuizzlerPage extends StatefulWidget {
  const QuizzlerPage({Key? key}) : super(key: key);

  @override
  State<QuizzlerPage> createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  final List<String> questions = [
    'Question 1',
    'Question 2',
    'Question 3',
    'End of Quiz'
  ];
  final List<bool> answers = [true, true, false];
  List<Widget> result = [];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questions[counter],
          style: const TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            margin: EdgeInsets.all(30.0),
            child: FlatButton(
              color: Color.fromARGB(255, 48, 102, 50),
              textColor: Colors.white,
              onPressed: () {
                setState(
                  () {
                    if (answers[counter] == true) {
                      result.add(
                        const Icon(
                          Icons.check_circle_outline,
                          size: 30,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      result.add(
                        const Icon(Icons.highlight_off),
                      );
                    }
                    if (counter < questions.length) {
                      counter++;
                    }
                  },
                );
              },
              child: const Text(
                ' True ',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
        ),
        RaisedButton(
          color: Colors.red,
          textColor: Colors.white,
          onPressed: () {
            setState(
              () {
                if (answers[counter] == false) {
                  result.add(
                    const Icon(Icons.check_circle_outline),
                  );
                } else {
                  result.add(const Icon(
                    Icons.highlight_off,
                    size: 30,
                    color: Colors.white,
                  ));
                }
                if (counter < questions.length) {
                  counter++;
                }
              },
            );
          },
          child: const Text(
            'False',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
        Row(
          children: result,
        )
      ],
    );
  }
}
