import 'package:flutter/material.dart';
import 'package:vhireapp/models/user.dart';
import 'package:vhireapp/screens/wrapper.dart';
import 'package:vhireapp/services/authentication.dart';
import 'package:vhireapp/shared/error.dart';

class HomePage extends StatefulWidget {

  late AuthenticatedUser user;

  HomePage({super.key, required this.user});

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Home !\nYour ID: ${widget.user.id}\n"),
            const SizedBox(height: 10),
            Text("Welcome Home !\nYour firstname: ${widget.user.firstname}\n"),
            const SizedBox(height: 10),
            Text("Welcome Home !\nYour lastname: ${widget.user.lastname}\n"),
            const SizedBox(height: 10),
            Text("Welcome Home !\nYour idcard: ${widget.user.idcard}\n"),
            const SizedBox(height: 10),
            Text("Welcome Home !\nYour licenseID: ${widget.user.license_id}\n"),
            const SizedBox(height: 10),
            Text("Welcome Home !\nYour gender: ${widget.user.gender}\n"),
            const SizedBox(height: 10),
            Text("Welcome Home !\nYour email: ${widget.user.email}\n"),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () async {
                dynamic result = await _auth.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const Wrapper()));
                if(result is CustomError) {
                  debugPrint(result.message);
                }
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
