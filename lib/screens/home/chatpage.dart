import 'package:flutter/cupertino.dart';
import 'package:xenchat/landingPage.dart';
import 'package:xenchat/screens/home/contact.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:xenchat/screens/home/profilepage.dart';

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
      home: Builder(
        builder: (context)=> Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pinkAccent,
            title: Image.asset(
              'media/Xen1.png',
              height: 60,
              width: 150,
            ),
            centerTitle: true,
          ),
          // bottomNavigationBar: FloatingNavbar(
          //   onTap: (int val) {
          //     setState(() { _index = val; } );
          //     if(val==0){
          //       Navigator.push(context,
          //           MaterialPageRoute(
          //             builder: (context)=> ChatPage(),
          //           )
          //       );
          //     }
          //     if(val==1){
          //       Navigator.push(context,
          //           MaterialPageRoute(
          //             builder: (context)=> Contact(),
          //           )
          //       );
          //     }
          //     if(val==2){
          //       Navigator.push(context,
          //           MaterialPageRoute(
          //             builder: (context)=> ProfilePage(),
          //           )
          //       );
          //     }
          //     if(val==3){
          //       Navigator.push(context,
          //           MaterialPageRoute(
          //             builder: (context)=> landingPage(),
          //           )
          //       );
          //     }
          //   },
          //   backgroundColor: CupertinoColors.systemPink,
          //   currentIndex: _index,
            // items: [
            //   FloatingNavbarItem(icon: Icons.message_outlined),
            //   FloatingNavbarItem(icon: Icons.contact_page_outlined ),
            //   FloatingNavbarItem(icon: Icons.account_box_outlined),
            //   FloatingNavbarItem(icon: Icons.exit_to_app_outlined),
            // ],
          // ),

          bottomNavigationBar: BottomNavigationBar(
            onTap: (int val) {
              setState(() { _index = val; } );
              if(val==0){
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context)=> ChatPage(),
                    )
                );
              }
              if(val==1){
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context)=> Contact(),
                    )
                );
              }
              if(val==2){
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context)=> ProfilePage(),
                    )
                );
              }
              if(val==3){
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context)=> landingPage(),
                    )
                );
              }
            },
            backgroundColor: CupertinoColors.systemPink,
            currentIndex: _index,
          
          items: const <BottomNavigationBarItem>[
            
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_sharp,size: 40.0, color: Colors.cyan,),
              label: 'Messages',),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.contacts_rounded,size: 40.0,color: Colors.cyan,),
              label: 'Contacts',),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp,size: 40.0, color: Colors.cyan ,),
              label: 'Profile',),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout,size: 30.0, color: Colors.cyan,),
              label: 'LogOut',              
            ),
          ],
          ), 

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Home page"),
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
                        fontSize: 20, color: Colors.cyanAccent, letterSpacing: 1.0),
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}