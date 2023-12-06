import 'package:flutter/material.dart';
import 'package:vhireapp/screens/authentication/signup_page.dart';
import 'package:vhireapp/services/authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: TextButton(
          child: const Text("Go to Sign Up Page ->"),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (BuildContext context) => const SignUpPage()) );
          }
        ),
      ),
    );
  }
}
