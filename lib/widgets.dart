import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent, width: 0)),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.orangeAccent, width: 1)),
    errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1)));

TextSpan textSpan(context, page, st1, st2) {
  return TextSpan(
      text: st1,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      children: <TextSpan>[
        TextSpan(
            text: st2,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                nextScreen(context, page);
              })
      ]);
}

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

SizedBox space(double val){
  return SizedBox(height: val);
}