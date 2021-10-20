import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices{

  final FirebaseAuth _firebaseAuth;

  AuthenticationServices(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

  Future<String> signIn(String email, String password) async{
    try{
      var a = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      print("XEN $a");
      return "signed in";
    } on FirebaseAuthException catch(e){
      return e.message.toString();
    }
  }

  Future<String> signUp(String email, String password) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "signed up";
    } on FirebaseAuthException catch(e){
      return e.message.toString();
    }
  }

}