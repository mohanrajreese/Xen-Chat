import 'package:xenchat/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xenchat/shared/constants.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String error = '';
  bool _isHidden = true;

  // text field state
  String email = '';
  String password = '';
  String mobileNo = '';
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
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
              Spacer(
                flex: 1,
              ),
              Text(
                'Register Here',
                style: TextStyle(
                  letterSpacing: 1.2,
                  fontFamily: 'Rubik',
                  fontSize: 20,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
              Spacer(
                flex: 1,
              ),
              TextFormField(
                decoration: textInputDecoration,
                onChanged: (val) {
                  setState(() => userName = val);
                },
              ),
              Spacer(
                flex: 1,
              ),
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: "Email address"),
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
              TextFormField(
                keyboardType: TextInputType.number,
                // Only numbers can be entered
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: textInputDecoration.copyWith(hintText: "Mobile No"),
                onChanged: (val) {
                  setState(() => mobileNo = val);
                },
              ),
              Spacer(
                flex: 1,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () async {
                  Navigator.push(
                    context,                    
                    MaterialPageRoute(builder: (context) => Loading()),
                  );

                  if (userName.trim() != "" &&
                      password.trim() != "" &&
                      email.trim() != "" &&
                      mobileNo.trim() != "") {
                    if (userName.length < 3 || mobileNo.length != 10) {
                      if (userName.length < 3) {
                        setState(() {
                          error = "UserName must be at least 3 characters";
                        });
                      }
                      if (mobileNo.length != 10) {
                        setState(() {
                          error = "Mobile No must be 10 characters";
                        });
                      }
                      Navigator.pop(context);
                      showToast(error,
                          context: context,
                          animation: StyledToastAnimation.slideFromTop,
                          reverseAnimation: StyledToastAnimation.slideToTop,
                          position: StyledToastPosition.top,
                          startOffset: Offset(0.0, -3.0),
                          reverseEndOffset: Offset(0.0, -3.0),
                          duration: Duration(seconds: 5),
                          //Animation duration   animDuration * 2 <= duration
                          animDuration: Duration(seconds: 1),
                          curve: Curves.elasticOut,
                          backgroundColor: Colors.redAccent,
                          reverseCurve: Curves.fastOutSlowIn);
                    } else {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                                email: email, password: password);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          // print('The password provided is too weak.');
                          setState(() {
                            error =
                                'The password provided is too weak.Try Stronger!';
                          });
                        } else if (e.code == 'email-already-in-use') {
                          // print('The account already exists for that email.');
                          setState(() {
                            error =
                                'The account already exists for that email.';
                          });
                        } else {
                          // print(e.message);
                          setState(() {
                            error = e.message as String;
                          });
                        }
                        Navigator.pop(context);
                        showToast(error,
                            context: context,
                            animation: StyledToastAnimation.slideFromTop,
                            reverseAnimation: StyledToastAnimation.slideToTop,
                            position: StyledToastPosition.top,
                            startOffset: Offset(0.0, -3.0),
                            reverseEndOffset: Offset(0.0, -3.0),
                            duration: Duration(seconds: 5),
                            //Animation duration   animDuration * 2 <= duration
                            animDuration: Duration(seconds: 1),
                            curve: Curves.elasticOut,
                            backgroundColor: Colors.redAccent,
                            reverseCurve: Curves.fastOutSlowIn);
                      }
                    }
                  } else {
                    setState(() {
                      error = "Please Enter";
                    });
                    if (password.trim() == "") {
                      setState(() {
                        error += " password,";
                      });
                    }
                    if (email.trim() == "") {
                      setState(() {
                        error += " Email Address,";
                      });
                    }
                    if (userName.trim() == "") {
                      setState(() {
                        error += " UserName,";
                      });
                    }
                    if (mobileNo.trim() == "") {
                      setState(() {
                        error += " Mobile No,";
                      });
                    }
                    Navigator.pop(context);
                    showToast(error,
                        context: context,
                        animation: StyledToastAnimation.slideFromTop,
                        reverseAnimation: StyledToastAnimation.slideToTop,
                        position: StyledToastPosition.top,
                        startOffset: Offset(0.0, -3.0),
                        reverseEndOffset: Offset(0.0, -3.0),
                        duration: Duration(seconds: 5),
                        //Animation duration   animDuration * 2 <= duration
                        animDuration: Duration(seconds: 1),
                        textStyle: TextStyle(
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        curve: Curves.elasticOut,
                        backgroundColor: Colors.amberAccent,
                        reverseCurve: Curves.fastOutSlowIn);
                  }
                },
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already Registered ?',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text(
                        "Click here to Login",
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 18,
                          color: Colors.pink,
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
    );
  }
}
