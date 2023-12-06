import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
  Future signIn() async {
    // Onésime, put your f*cking signIn function here
    // Uses the _auth attribute of this class
    // Follow my model if u want !
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
}
