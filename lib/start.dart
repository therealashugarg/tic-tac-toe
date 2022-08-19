// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tictactoe/color.dart';
import 'package:tictactoe/home.dart';

class StartGame extends StatefulWidget {
  const StartGame({Key? key}) : super(key: key);

  @override
  State<StartGame> createState() => _StartGameState();
}

class _StartGameState extends State<StartGame>
    with SingleTickerProviderStateMixin {
  // CONTROLLER
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 11,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SizedBox(
                  height: 120,
                  child: Image.asset('lib/images/tic-tac-toe.png',)),
            ),
          ),
          Expanded(
            flex: 11,
            child: Center(
              child: SizedBox(
                  height: 350,
                  child: Lottie.asset('assets/loading.json', controller: _controller)),
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
                onTap: () async {
                  _controller.forward();
                  _controller.repeat();
                  await Future.delayed(const Duration(seconds: 5), () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => tictactoe()));
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mainColor.accentColor,
                    ),
                    child: Center(
                      child: Text(
                        'Start',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
