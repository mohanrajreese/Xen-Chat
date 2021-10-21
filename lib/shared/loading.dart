import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7E6F4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitSpinningLines(
              color: Colors.pinkAccent,
              size: 100.0,
            ),
            SpinKitDancingSquare(
              color: Colors.pinkAccent,
              size: 100.0,
            ),
            // SizedBox(height: 50.0,),
            // Text(
            //     "Wait a Second...",
            //   style: TextStyle(
            //     color: Colors.Black,
            //     fontSize: 35.0,
            //     fontWeight: FontWeight.normal,
            //     letterSpacing: 1.0
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}