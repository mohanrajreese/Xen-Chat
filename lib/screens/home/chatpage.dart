import 'package:xenchat/screens/home/profilepage.dart';
// import 'package:xenchat/screens/home/contact.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF0F0F0),
          title: Image.asset(
            'media/XenLogo.png',
            height: 50,
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ));
          },
          backgroundColor: Color(0xFF9088D3),
          elevation: 1.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.white, width: 4.0)),
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: FloatingNavbar(
          onTap: (int val) {
            setState(() {
              _index = val;
            });
          },
          backgroundColor: Color(0xFF9088D3),
          currentIndex: _index,
          items: [
            FloatingNavbarItem(icon: Icons.format_list_bulleted_sharp),
            FloatingNavbarItem(
              icon: Icons.apps_rounded,
            ),
            FloatingNavbarItem(icon: Icons.supervisor_account_rounded),
            FloatingNavbarItem(icon: Icons.notifications),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Chat page"),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  backgroundColor: const Color(0xFF9088D3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                child: Text(
                  'LOGOUT',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, letterSpacing: 1.0),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
