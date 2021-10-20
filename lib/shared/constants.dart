import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintText: "Username",
  fillColor: const Color(0xFFF5F5F5),
  filled: true,
  contentPadding: EdgeInsets.all(20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white70, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pinkAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
);

