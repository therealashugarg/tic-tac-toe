// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/box.dart';
import 'package:tictactoe/reset.dart';
import 'color.dart';

class tictactoe extends StatefulWidget {
  const tictactoe({Key? key}) : super(key: key);

  @override
  State<tictactoe> createState() => _tictactoeState();
}

class _tictactoeState extends State<tictactoe> {
  int xWins = 0;
  int oWins = 0;
  int draw = 0;
  int boxFilled = 0;
  bool xTurn = true;
  var whoWins = '';

  final List<String> Boxes = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: SizedBox(
                  height: 20,
                  child: Center(
                    child: Text(
                      "Do you really want to exit the game?",
                      style: TextStyle(fontFamily: 'BubblegumSans'),
                    ),
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => SystemNavigator.pop(),
                        child: Container(
                          width: 100,
                          height: 40,
                          child: Center(
                              child: Text(
                            'Exit',
                            style: TextStyle(fontFamily: 'BubblegumSans', color: Colors.white),
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: mainColor.accentColor),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 100,
                          height: 40,
                          child: Center(
                              child: Text(
                            'Cancel',
                            style: TextStyle(fontFamily: 'BubblegumSans', color: Colors.white),
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: mainColor.accentColor),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              'Tic Tac Toe',
              style: TextStyle(fontFamily: 'BubblegumSans', color: mainColor.accentColor),
            ),
          ),
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: MyBox(
                    text1: 'x',
                    text2: xWins.toString(),
                  )),
                  Expanded(
                      child: DrawBox(
                    text: draw.toString(),
                  )),
                  Expanded(
                      child: MyBox(
                    text1: 'o',
                    text2: oWins.toString(),
                  ))
                ],
              ),
              Expanded(
                  flex: 3,
                  child: GridView.builder(
                      itemCount: Boxes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (xTurn && Boxes[index] == '') {
                                  Boxes[index] = 'x';
                                  xTurn = false;
                                  boxFilled += 1;
                                } else if (!xTurn && Boxes[index] == '') {
                                  Boxes[index] = 'o';
                                  xTurn = true;
                                  boxFilled += 1;
                                }

                                _checkWinner();
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade500,
                                        offset: Offset(4.0, 4.0),
                                        blurRadius: 15.0,
                                        spreadRadius: 1.0),
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4.0, -4.0),
                                        blurRadius: 15.0,
                                        spreadRadius: 1.0)
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                Boxes[index],
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Boxes[index] == 'x'
                                        ? mainColor.primaryColor
                                        : mainColor.secondaryColor),
                              )),
                            ),
                          ),
                        );
                      })),
              SizedBox(
                height: 100,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        xWins = 0;
                        oWins = 0;
                        draw = 0;
                      });
                    },
                    child: resetButton()),
              )
            ],
          )),
    );
  }

  void _checkWinner() {
    // check first row
    if (Boxes[0] != '' && Boxes[0] == Boxes[1] && Boxes[0] == Boxes[2]) {
      if (Boxes[0] == 'x') {
        whoWins = 'x wins the game!';
        xWins++;
        xTurn = true;
      } else {
        whoWins = 'o wins the game!';
        oWins++;
        xTurn = false;
      }
      DialogBox(context);
      return;
    }
    // check second row
    if (Boxes[3] != '' && Boxes[3] == Boxes[4] && Boxes[3] == Boxes[5]) {
      if (Boxes[3] == 'x') {
        whoWins = 'x wins the game!';
        xWins++;
        xTurn = true;
      } else {
        whoWins = 'o wins the game!';
        oWins++;
        xTurn = false;
      }
      DialogBox(context);
      return;
    }
    // check third row
    if (Boxes[6] != '' && Boxes[6] == Boxes[7] && Boxes[6] == Boxes[8]) {
      if (Boxes[6] == 'x') {
        whoWins = 'x wins the game!';
        xWins++;
        xTurn = true;
      } else {
        whoWins = 'o wins the game!';
        oWins++;
        xTurn = false;
      }
      DialogBox(context);
      return;
    }
    // check first column
    if (Boxes[0] != '' && Boxes[0] == Boxes[3] && Boxes[0] == Boxes[6]) {
      if (Boxes[0] == 'x') {
        whoWins = 'x wins the game!';
        xWins++;
        xTurn = true;
      } else {
        whoWins = 'o wins the game!';
        oWins++;
        xTurn = false;
      }
      DialogBox(context);
      return;
    }
    // check second column
    if (Boxes[1] != '' && Boxes[1] == Boxes[4] && Boxes[1] == Boxes[7]) {
      if (Boxes[1] == 'x') {
        whoWins = 'x wins the game!';
        xWins++;
        xTurn = true;
      } else {
        whoWins = 'o wins the game!';
        oWins++;
        xTurn = false;
      }
      DialogBox(context);
      return;
    }
    // check third column
    if (Boxes[2] != '' && Boxes[2] == Boxes[5] && Boxes[2] == Boxes[8]) {
      if (Boxes[2] == 'x') {
        whoWins = 'x wins the game!';
        xWins++;
        xTurn = true;
      } else {
        whoWins = 'o wins the game!';
        oWins++;
        xTurn = false;
      }
      DialogBox(context);
      return;
    }
    // check first diagonal
    if (Boxes[0] != '' && Boxes[0] == Boxes[4] && Boxes[0] == Boxes[8]) {
      if (Boxes[0] == 'x') {
        whoWins = 'x wins the game!';
        xWins++;
        xTurn = true;
      } else {
        whoWins = 'o wins the game!';
        oWins++;
        xTurn = false;
      }
      DialogBox(context);
      return;
    }
    // check second diagonal
    if (Boxes[6] != '' && Boxes[6] == Boxes[4] && Boxes[6] == Boxes[2]) {
      if (Boxes[6] == 'x') {
        whoWins = 'x wins the game!';
        xWins++;
        xTurn = true;
      } else {
        whoWins = 'o wins the game!';
        oWins++;
        xTurn = false;
      }
      DialogBox(context);
      return;
    }
    if (boxFilled == 9) {
      whoWins = 'Match got drawn';
      draw++;
      xTurn = true;
      DialogBox(context);
    }
  }

  Future DialogBox(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(height: 20 ,child: Center(child: Text(whoWins, style: TextStyle(fontFamily: 'BubblegumSans'),))),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                        onTap: () => exit(0),
                        child: Container(
                          width: 100,
                          height: 40,
                          child: Center(
                              child: Text(
                            'Exit',
                            style: TextStyle(fontFamily: 'BubblegumSans', color: Colors.white),
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: mainColor.accentColor),
                        ),
                      ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Boxes.replaceRange(0, Boxes.length, [
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                        ]);
                      });
                      boxFilled = 0;
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      child: Center(
                          child: Text(
                        'Play again',
                        style: TextStyle(fontFamily: 'BubblegumSans', color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: mainColor.accentColor),
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ],
          );
        });
  }
}
