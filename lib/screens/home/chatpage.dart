import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        appBar: AppBar(
          title: Text("XenChat"),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Center(
          child: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("media/landingPage.png"),
            // fit:BoxFit.cover
          ),
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(""),
              
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  elevation: 100,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 11),
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
               
                child: Text(
                  'LOGOUT',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      letterSpacing: 1.0
                  ),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          
          items: const <BottomNavigationBarItem>[
            
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_sharp,size: 40.0, color: Colors.cyan,),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.contacts_rounded,
                size: 40.0,
                color: Colors.cyan,
              ),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp,size: 40.0, color: Colors.cyan ,),
              label: 'Profile',
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout,size: 30.0, color: Colors.cyan,),
              label: 'LogOut',              
            ),
          ],
          
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red[900],
          // showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}