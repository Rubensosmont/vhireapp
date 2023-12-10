import 'package:flutter/material.dart';
import 'package:vhireapp/models/user.dart';
import 'package:vhireapp/screens/authentication/login_page.dart';
import 'package:vhireapp/screens/authentication/signup_steps.dart';
import 'package:vhireapp/services/authentication.dart';
import 'package:vhireapp/shared/loading.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final AuthService _auth = AuthService();
  bool loading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String error = " ";

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                Image.asset("assets/images/vhire.png", scale: 5),
                const SizedBox(height: 75,),
                const Text("Bienvenue !", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
                const SizedBox(height: 10),
                const Text('Création de compte', style: TextStyle(fontSize: 18)),

                // Email text field
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ),

                // Password text field
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mot de passe',
                        ),
                      ),
                    ),
                  ),
                ),

                // signIn Button
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () async {
                      setState(() => loading = true );
                      dynamic result = await _auth.signUp(_emailController.text, _passwordController.text);
                      if(result is AuthenticatedUser) {
                        debugPrint(result.id);
                        result.update(email: _emailController.text);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>  SignupSteps(user: result)));
                      } else {
                        setState(() {
                          loading = false;
                          error = result.message;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration( color: const Color(0xFF5371E9),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          "S'iscrire",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,),
                        ),
                      ),
                    ),
                  ),
                ),

                //Registration page link here
                const SizedBox(height: 3),
                Text(error, style: const TextStyle(fontSize: 10, color: Color(0xFFDC5757))),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Vous avez déjà un compte?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                      } ,
                      child: const Text(" Connectez vous!",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

              ],),
          ),
        ),
      ),
    );
  }
}
