import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xenchat/shared/constants.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

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
          padding: const EdgeInsets.all(40.0),
          child: Form(
            child: Column(
              children: <Widget>[
                Spacer(flex: 3,),
                Image.asset(
                  'media/XenLogo.png',
                  height: 90.0,
                  width: 600.0,
                ),
                Spacer(flex: 1,),
                Text(
                  '',
                  style: TextStyle(
                    letterSpacing: 1.2,
                    fontFamily: 'Raleway',
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(flex: 1,),
                TextFormField(
                  decoration: textInputDecoration,
                  validator: (val) => val!="" ? 'Enter an Username' : null,
                  onChanged: (val) {
                    setState(() => userName = val);
                  },
                ),
                Spacer(flex: 1,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Email address"),
                  validator: (val) => val!="" ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                Spacer(flex: 1,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Password"),
                  validator: (val) => val!="" ? 'Enter an Password' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                Spacer(flex: 1,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  // Only numbers can be entered
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: textInputDecoration.copyWith(hintText: "Mobile No"),
                  validator: (val) => val!="" ? 'Enter an Mobile No' : null,
                  onChanged: (val) {
                    setState(() => mobileNo = val);
                  },
                ),
                Spacer(flex: 1,),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 6,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                  onPressed: () async{
                    try {
                      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: email,
                          password: password
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                Spacer(flex: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an Account ?',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 18,
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}