import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int firstDice = 1;
  int secondDice = 1;
  int counter = 0;
  int num = 0;

  void changeDice() {
    setState(() {
      firstDice = Random().nextInt(6) + 1;
      secondDice = Random().nextInt(6) + 1;
    });
  }

  Widget defineWin() {
    if (firstDice == secondDice) {
      return Card(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          width: 100,
          height: 100,
          child: Center(child: Text("You win")),
        ),
        color: Colors.yellow,
      );
    } else {
      return Card(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          width: 100,
          height: 100,
          child: Center(child: Text("You lose")),
        ),
        color: Colors.yellow,
      );
    }
  }

  void numberOfAttempts() {
    if (firstDice != secondDice) {
      setState(() {
        num = counter;
        counter++;
      });
    } else {
      counter = 0;
    }

    //return Text("Number of attempts is $counter");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.asset('images/d$firstDice.jpg'),
                  ),
                  Expanded(child: Image.asset('images/d$secondDice.jpg')),
                ],
              ),
              defineWin(),
              Text(num.toString()),
              TextButton(
                  onPressed: () {
                    changeDice();
                    numberOfAttempts();
                  },
                  child: Text('Tap to Randomize'))
            ],
          ),
        ),
      ),
    );
  }
}
