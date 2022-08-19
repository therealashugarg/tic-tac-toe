// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'color.dart';

class resetButton extends StatelessWidget {
  const resetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          decoration: BoxDecoration(
              color: mainColor.accentColor,
              borderRadius: BorderRadius.circular(10)),
          // ignore: prefer_const_constructors
          child: Center(
            child: const Text(
              'Reset',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          )),
    );
  }
}
