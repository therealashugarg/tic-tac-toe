// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tictactoe/color.dart';

class MyBox extends StatelessWidget {
  final text1, text2;

  MyBox({this.text1, this.text2});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: Text(
              text1,
              style: TextStyle(color: text1 == 'x' ? mainColor.primaryColor : mainColor.secondaryColor, fontSize: 35),
            )),
            Expanded(
                child: Text(
              text2 + ' wins',
              style: TextStyle(color: text1 == 'x' ? mainColor.primaryColor : mainColor.secondaryColor, fontSize: 15),
            )),
          ],
        ),
      ),
    );
  }
}


class DrawBox extends StatelessWidget {
  final text;

  DrawBox({this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            SizedBox(
              height: 21,
            ),
            Icon(Icons.balance, size: 35, color: Colors.grey[600],),
            SizedBox(height: 4),
            Expanded(
                child: Text(
              text + ' draws',
              style: TextStyle(color: Colors.grey[600], fontSize: 15),
            )),
          ],
        ),
      ),
    );
  }
}
