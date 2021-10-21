import 'dart:async';

import 'package:xenchat/screens/Authentication/login.dart';
import 'package:xenchat/screens/home/profilepage.dart';
import 'package:xenchat/screens/home/contact.dart';
import 'package:xenchat/screens/home/chatpage.dart';
import 'package:xenchat/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:xenchat/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/Authentication/login.dart';
import './screens/Authentication/signup.dart';
import 'landingPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  dynamic currentUserData =
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print("user is currently not logged in");
      runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: landingPage(),
        routes: {
          '/initpage': (context) => landingPage(),
          '/signup': (context) => Signup(),
          '/login': (context) => Login(),
          '/loading': (context) => Loading(),
          '/profilepage': (context) => ProfilePage(),
          '/chatpage': (context) => ChatPage(),
          '/contact': (context) => Contact()
        },
      ));
    } else {
      print("user = $user");
      runApp(ChatPage());
    }
  });
}

// dark purple - 0xFF706897
// light purple - 0xFFE7E6F4
// text color [dark purple] - 0xFF262A35
// medium purple - 0xFF9088D3