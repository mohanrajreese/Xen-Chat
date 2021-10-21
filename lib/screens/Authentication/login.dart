import 'package:xenchat/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xenchat/shared/constants.dart';
//import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String error = '';
  bool _isHidden = true;

  // text field state
  String email = '';
  String resendEmail = '';
  String password = '';

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: <Widget>[
                Spacer(
                  flex: 4,
                ),
                Image.asset(
                  'media/XenLogo.png',
                  height: 100.0,
                  width: 600.0,
                ),
                Spacer(
                  flex: 2,
                ),
                Text(
                  '',
                  style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 20,
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.8),
                  textAlign: TextAlign.left,
                ),
                Spacer(
                  flex: 2,
                ),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: "Email address"),
                  validator: (val) => val != "" ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                Spacer(
                  flex: 1,
                ),
                TextFormField(
                obscureText: _isHidden,
                decoration: textInputDecoration.copyWith(
                  contentPadding: EdgeInsets.all(16.0),
                  hintText: "Password",
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        _isHidden = !_isHidden;
                      });
                    },
                    child: Icon(Icons.visibility),
                  ),
                ),
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
                Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                        onPressed: () async {
                          Alert(
                              context: context,
                              title: "Find your Account",
                              content: Column(
                                children: <Widget>[
                                  TextField(
                                    onChanged: (val) {
                                      setState(() => resendEmail = val);
                                    },
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.email_rounded),
                                      labelText: 'Email address',
                                    ),
                                  ),
                                ],
                              ),
                              buttons: [
                                DialogButton(
                                    onPressed: () async {
                                      if (resendEmail.trim() != "") {
                                        await auth.sendPasswordResetEmail(
                                            email: resendEmail);
                                        Navigator.pop(context);
                                      } else {}
                                    },
                                    child: Text(
                                      "Confirm",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          letterSpacing: 1.0,
                                          color: Colors.white),
                                    ))
                              ]).show();
                        },
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ],
                ),
                Spacer(
                  flex: 2,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 6,
                    padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 20, color: Colors.white, letterSpacing: 1.0),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loading()),
                    );
                    if (email.trim() != "" && password.trim() != "") {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: email.trim(), password: password.trim());
                      } on FirebaseAuthException catch (e) {
                        // print(e.message);
                        setState(() {
                          error = e.message as String;
                        });

                        Navigator.pop(context);

                        showToast(error,
                            context: context,
                            animation: StyledToastAnimation.slideFromTopFade,
                            reverseAnimation: StyledToastAnimation.slideToTopFade,
                            position: StyledToastPosition.top,
                            startOffset: Offset(0.0, -3.0),
                            reverseEndOffset: Offset(0.0, -3.0),
                            duration: Duration(seconds: 6),
                            //Animation duration   animDuration * 2 <= duration
                            animDuration: Duration(seconds: 1),
                            curve: Curves.easeIn,
                            backgroundColor: Colors.cyan,
                            reverseCurve: Curves.easeOut);
                      }
                    } else {
                      if (email.trim() == "" && password.trim() == "") {
                        setState(() {
                          error = "Please, Enter Email and password";
                        });
                      } else if (email.trim() == "" && password.trim() != "") {
                        setState(() {
                          error = "Please, Enter Email Address";
                        });
                      } else {
                        setState(() {
                          error = "Please, Enter Password";
                        });
                      }
                      Navigator.pop(context);
                      showToast(error,
                          context: context,
                          animation: StyledToastAnimation.slideFromTopFade,
                          reverseAnimation: StyledToastAnimation.slideToTopFade,
                          position: StyledToastPosition.top,
                          startOffset: Offset(0.0, -3.0),
                          reverseEndOffset: Offset(0.0, -3.0),
                          duration: Duration(seconds: 5),
                          //Animation duration   animDuration * 2 <= duration
                          animDuration: Duration(seconds: 1),
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                          curve: Curves.fastLinearToSlowEaseIn,
                          backgroundColor: Colors.cyan,
                          reverseCurve: Curves.fastOutSlowIn);
                    }
                  },
                ),
                Spacer(
                  flex: 2,
                ),
                // const Divider(
                //   height: 20,
                //   thickness: 1,
                //   indent: 10,
                //   endIndent: 10,
                //   color: const Color(0xFF706897),
                // ),
                // Spacer(
                //   flex: 2,
                // ),
                ElevatedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      elevation: 5,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                        side: BorderSide(
                            color: const Color(0xFF706897), width: 1),
                      ),
                    ),
                    icon: Image.asset(
                      "media/glogo.jpg",
                      width: 40.0,
                      height: 40.0,
                    ),
                    label: Text(
                      "Continue with Google",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 0.1,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                    )),
                Spacer(
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an Account ?",
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/signup');
                        },
                        child: Text(
                          "Create one..!",
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 18,
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
