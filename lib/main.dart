// ignore_for_file: prefer_const_constructors, must_call_super, duplicate_ignore

import 'package:xenchat/screens/Authentication/login.dart';
import 'package:xenchat/screens/home/chatpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/Authentication/login.dart';
import './screens/Authentication/signup.dart';
import 'landingPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  dynamic currentUserData = FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      print("user is currently not logged in");
      runApp(MaterialApp(
        home: MyApp(),
        routes: {
          '/signup': (context) => Signup(),
          '/login': (context) => Login()
        },
      ));
    } else {
      print("user = $user");
      // ignore: prefer_const_constructors
      runApp(ChatPage());
    }
  });

}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  dynamic page = "landingPage";

  void xen() async{
    await FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        page = landingPage();
      } else {
        page = ChatPage();
      }
    });
  }

  @override
  void initState() {
    xen();
  }

  @override
  Widget build(BuildContext context) {
    if(page=="landingPage"){
      return landingPage();
    }
    else{
      return page;
    }
  }
}
