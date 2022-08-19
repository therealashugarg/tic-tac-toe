// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tictactoe/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(
        textTheme: TextTheme(bodyText2: TextStyle(fontFamily: 'BubblegumSans'))),
      home: StartGame(),
    );
  }
}
