import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xenchat/shared/constants.dart';
// import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>  {

  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String mobileNo = '';
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: <Widget>[
                Spacer(flex: 4,),
                Image.asset(
                  'media/XenLogo.png',
                  height: 90.0,
                  width: 600.0,
                ),
                Spacer(flex: 1,),
                Text(
                  'Sign in to continue',
                  style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.8
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(flex: 2,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Email address"),
                  validator: (val) => val!="" ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                Spacer(flex: 1,),
                TextFormField(
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(hintText: "Password"),
                  validator: (val) => val!="" ? 'Enter an Password' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                        onPressed: (){},
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                    ),
                  ],
                ),
                Spacer(flex: 1,),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 6,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        letterSpacing: 1.0
                    ),
                  ),
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email,
                          password: password
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  },
                ),
                Spacer(flex: 1,),
                const Divider(
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                  color: const Color(0xFF706897),
                ),
                Spacer(flex: 1,),
                ElevatedButton.icon(
                    onPressed: (){

                    },
                    style: OutlinedButton.styleFrom(
                      elevation: 2,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                      backgroundColor:const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                            color: Colors.cyan,
                            width: 1
                        ),
                      ),
                    ),
                    icon: Image.asset(
                      "media/glogo.jpg",
                      width: 40.0,
                      height: 40.0,
                    ),
                    label: Text(
                      "Continue with Google Account",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 0.1,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0
                      ),
                    )
                ),
                Spacer(flex: 2,),
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
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, '/signup');
                        },
                        child: Text(
                          "Create one..",
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 20,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
