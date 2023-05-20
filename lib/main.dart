import 'package:flutter/material.dart';
import 'question.dart';
import 'answer_again.dart';

// define the main entry point of the app
void main() {
  // run the app by calling MyApp
  runApp(MyApp());
}

// define a stateful widget called MyApp
class MyApp extends StatefulWidget {
  // override the createState method to return an instance of MyAppState
  @override
  State<MyApp> createState() => MyAppState();
}

// define the state for MyApp
class MyAppState extends State<MyApp> {
  // declare a variable C to keep track of the current question index
  var C = 0;

  // define a callback function that is called when an elevated button is pressed
  void buttonPressed() {
    // update the state of the app by incrementing C and resetting it to 0 if it exceeds the length of the listofquestions
    setState(() {
      C += 1;
      if (C >= listofquestions.length) {
        C = 0;
      }
    });
    // print the current value of C to the console
    print(C);
    // print "hello world" to the console
    print("hello world");
  }

  // define a list of questions to be displayed on the screen
  var listofquestions = [
    {
      'questions': "what is your favourite color?",
      'answers': ['red', 'blue', 'green', 'yellow']
    },
    {
      'questions': "what is your fav food?",
      'answers': ['pizza', 'burger', 'pasta', 'noodles']
    },
    {
      'questions': "what is your favourite animal?",
      'answers': ['dog', 'cat', 'rabbit', 'lion']
    },
  ];

  // override the build method to create the UI for the app
  @override
  Widget build(BuildContext context) {
    var currentquestion = listofquestions[C];
    // create a MaterialApp widget
    return MaterialApp(
      // set the home widget of the MaterialApp to a Scaffold widget
      home: Scaffold(
        // set the title of the app bar
        appBar: AppBar(title: Text("My First App!")),

        // create a Column widget to hold the UI elements
        body: Column(
          // create a list of widgets to be displayed in the column
          children: <Widget>[
            Question_again(currentquestion['questions'].toString()),
            // display the current question using the Text widget and the value of C as the index of the question
            // Text(currentquestion['questions'].toString(),
            //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),

            ...(listofquestions[C]['answers'] as List<String>).map((answer) {
              return Answer_Again(answer, buttonPressed);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
