import 'package:flutter/material.dart';

class landingPage extends StatelessWidget {
const landingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("media/test3.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          children: <Widget>[
            Spacer(flex: 4,),
            Image.asset(
              'media/XenLogo.png',
              height: 200, 
              width:600,
            ),
            Spacer(flex: 6,),
            
            Spacer(flex: 6,),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  elevation: 6,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),),),
              child: Text(
                'Lets Chat',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
            Spacer(flex: 2,),
          ],
        ),
      ),
      ),
    );
  }
}
