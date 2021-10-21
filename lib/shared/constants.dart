import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

const textInputDecoration = InputDecoration(
  hintText: "Username",
  fillColor: const Color(0xFFF5F5F5),
  filled: true,
  contentPadding: EdgeInsets.all(20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pinkAccent, width: 0.5),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);

const formTextInputDecoration = InputDecoration(
  filled: true,
  contentPadding: EdgeInsets.all(20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF706897), width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(20.0))
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: const Color(0xFF706897), width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);

const formTextInputStyle = TextStyle(
  fontSize: 16.0,
  color: Color(0xFF706897),
);