import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //  このwidgetがルート
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Hand? myHand;
  Hand? computerHand;
  Result? result;

  void chooseComputerText() {
    final random = Random();
    final randomNumber = random.nextInt(3);
    final hand = Hand.values[randomNumber];

    setState(() {
      computerHand = hand;
    });
    decideResult();
  }

  void decideResult() {
    // myHandとcomputerHandを比較する
    if (myHand == null || computerHand == null) {
      //両方null
      return;
    }

    final Result result;

    if (myHand == computerHand) {
      //あいこ
      result = Result.draw;
    } else if (myHand == Hand.rock && computerHand == Hand.scissors) {
      //ぐーとちょきで勝ち
      result = Result.win;
    } else if (myHand == Hand.scissors && computerHand == Hand.paper) {
      //ちょきとパーで勝ち
      result = Result.win;
    } else if (myHand == Hand.paper && computerHand == Hand.rock) {
      // パートぐーで勝ち
      result = Result.win;
    } else {
      result = Result.lose;
    }
    setState(() {
      this.result = result;
    });
  }

  @override
  // setStateが呼び出されるたびに実行される
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // MyHomePageメソッドから値を取ってきている
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // メインの方向に子を配置する
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('コンピュータ', style: TextStyle(fontSize: 16)),
            Text(computerHand?.text ?? '?', style: TextStyle(fontSize: 80)),
            SizedBox(height: 10),
            Text(
              // Result.win.text, //勝ち
              result?.text ?? '?',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 40),
            Text(myHand?.text ?? '?', style: TextStyle(fontSize: 200)),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                // myjankenText = Hand.rock.text;
                myHand = Hand.rock;
              });
              chooseComputerText();
            },
            child: Text(Hand.rock.text, style: TextStyle(fontSize: 30)),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                myHand = Hand.scissors;
              });
              chooseComputerText();
            },
            child: Text(Hand.scissors.text, style: TextStyle(fontSize: 30)),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                myHand = Hand.paper;
              });
              chooseComputerText();
            },
            child: Text(Hand.paper.text, style: TextStyle(fontSize: 30)),
          ),
        ],
      ),
    );
  }
}

enum Hand {
  rock,
  scissors,
  paper;

  String get text {
    switch (this) {
      case Hand.rock:
        return '👊';
      case Hand.scissors:
        return '✌️';
      case Hand.paper:
        return '✋';
    }
  }
}

enum Result {
  win,
  lose,
  draw;

  String get text {
    switch (this) {
      case Result.win:
        return '勝ち';
      case Result.lose:
        return '負け';
      case Result.draw:
        return 'あいこ';
    }
  }
}
