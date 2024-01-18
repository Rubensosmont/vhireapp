import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vhireapp/models/user.dart';
import 'package:vhireapp/shared/error.dart';

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
    } on FirebaseAuthException catch(e) {
      return CustomError(e.code, e.message!);
    }
  }

  // Sign up with email and password function
  Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      return _authenticatedUserFromUser(user);
    } on FirebaseAuthException catch(e) {
      return CustomError(e.code, e.message!);
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } on FirebaseAuthException catch(e) {
      return CustomError(e.code, e.message!);
    }
  }

  // Reset password
  Future pwdReset(String email) async{
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      return 'Lien de reinitialisation envoyé! Vérifiez vôtre mail.';
    } on FirebaseAuthException catch(e){
      return CustomError(e.code, e.message!);
    }
  }

  // Check if email exists
  static Future<bool> isEmailAlreadyRegistered(String email) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: email.trim()).get();
      return querySnapshot.docs.isNotEmpty;
    } on FirebaseException catch(e) {
      return false;
    }
  }
}
