import 'package:flutter/material.dart';
import 'package:vhireapp/models/user.dart';
import 'package:vhireapp/services/authentication.dart';

class HomePage extends StatefulWidget {

  final AuthenticatedUser user;

  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Welcome Home !\nYour ID: ${widget.user.id}\n"),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () async {
                await _auth.signOut();
              },
              color: Colors.deepPurple[200],
              child: const Text('Sign Out')
            )
          ],
        ),
      ),
    );
  }
}
