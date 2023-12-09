import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vhireapp/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Convert a firebase user into an authenticatedUser
  AuthenticatedUser? _authenticatedUserFromUser(User? user) {
    return (user!=null) ? AuthenticatedUser(id: user.uid) : null;
  }

  // Stream listening to authentication changes
  Stream<AuthenticatedUser?> get user {
    return _auth.authStateChanges().map(_authenticatedUserFromUser);
  }

  // Sign in with email and password function
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      return _authenticatedUserFromUser(user);
    } catch(e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // Sign up with email and password function
  Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      return _authenticatedUserFromUser(user);
    } catch(e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      debugPrint(e.toString());
      return null;
    }
  }

  //Reset password
  Future pwdReset(String email, BuildContext context) async{
    try {
      await _auth.sendPasswordResetEmail(email: email.trim() );
      showDialog(
          context: context,
          builder: (context)
          {
            return AlertDialog(content: Text('Password reset link sent! Check your mail'),);
          },
      );
    } on FirebaseAuthException catch(e){
      debugPrint(e.toString());
      showDialog(
        context: context,
        builder: (context)
      {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      },
      );
    }
  }
}
