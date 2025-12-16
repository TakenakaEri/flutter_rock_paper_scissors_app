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
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
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
  int _counter = 0;

  void _incrementCounter() {
    // setStateを呼び出すことでbuildが再実行される
    setState(() {
      _counter++;
    });
  }
  //  変数の定義
  String jankenText = '👊';
  //自作関数
  void _chooseJankenText(){
    setState(() {
      jankenText='✋';
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
          mainAxisAlignment: .center,
          children: [
            Text(
              '相手',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '✌️',
              style: TextStyle(fontSize: 100),
            ),
            SizedBox(
              height:80,
            ),
            Text(
              '自分',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              // 変数を使用
              jankenText,
              style: TextStyle(fontSize: 200),
            ),
          ],
        ),
      ),
      // Rowで囲って3つのフローティングボタンを入れる
      // floatingActionButton: FloatingActionButton(
      //   // 自作関数の呼び出し
      //   onPressed: _chooseJankenText,
      //   child: const Icon(Icons.add),
      // ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: (){
                setState(() {
                  jankenText='✊';
                });
              },
            child: const Text(
              '👊',
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                jankenText='✌️';
              });
            },
            child: const Text(
              '✌️',
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                jankenText='✋';
              });
            },
            child: const Text(
              '✋',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
