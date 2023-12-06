import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vhireapp/models/user.dart';
import 'package:vhireapp/screens/authentication/login_page.dart';
import 'package:vhireapp/screens/home/home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final AuthenticatedUser? user = Provider.of<AuthenticatedUser?>(context);

    // return either signIn or home page
    if(user==null) {
      return LoginPage();
    } else {
      return HomePage(user: user);
    }
  }
}
