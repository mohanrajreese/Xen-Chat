import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xenchat/shared/constants.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Home page"),
                
              ],
            ),
          ),
      ),
    );
  }
}
