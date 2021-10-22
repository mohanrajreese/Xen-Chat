import 'package:xenchat/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class landingPage extends StatelessWidget {
  const landingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9088D3),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("media/test4.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Spacer(
              flex: 3,
            ),
            Image.asset(
              'media/XenLogo.png',
              height: 200.0,
              width: 600.0,
            ),
            Spacer(flex: 6,),
            
            Spacer(flex: 6),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                elevation: 100,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Let\'s Chat',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      ),
    );
  }
}
