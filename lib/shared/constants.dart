import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

const textInputDecoration = InputDecoration(
  hintText: "Username",
  fillColor: const Color(0xFFF5F5F5),
  filled: true,
  contentPadding: EdgeInsets.all(20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),


  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pinkAccent, width: 0.5),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
);

const formTextInputDecoration = InputDecoration(
  filled: true,
  contentPadding: EdgeInsets.all(20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.amberAccent, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(12.0))
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.amberAccent, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
);

const formTextInputStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.greenAccent,
);