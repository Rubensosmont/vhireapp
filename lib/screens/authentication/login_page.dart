import 'package:flutter/material.dart';
import 'package:vhireapp/models/user.dart';
import 'package:vhireapp/screens/authentication/signup_page.dart';
import 'package:vhireapp/services/authentication.dart';
import 'package:vhireapp/shared/loading.dart';
import 'package:vhireapp/screens/wrapper.dart';
import 'package:vhireapp/screens/authentication/password_forget_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();
  bool loading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String error = " ";
  bool _showPassword = false;

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
                const SizedBox(height: 60,),
                const Text("Bienvenue !", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
                const SizedBox(height:10,),
                const Text('Connectez vous', style: TextStyle(fontSize: 18)),
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
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mot de passe',
                          suffixIcon: IconButton(
                            icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                            onPressed: () => setState(() => _showPassword = !_showPassword),
                          )
                        ),
                      ),
                    ),
                  ),
                ),

                // Login Button
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () async {
                      setState(() => loading = true );
                      dynamic result = await _auth.signIn(_emailController.text, _passwordController.text);
                      if(result is AuthenticatedUser) {
                        debugPrint(result.id);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const Wrapper()));
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
                          "Se connecter",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 3),
                Text(error, style: const TextStyle(fontSize: 10, color: Color(0xFFDC5757))),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) => PasswordForgetPage()),
                    );
                  },
                  child: const Text(
                    "Mot de passe oublié ?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                //Registration page link here
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Vous n'avez pas de compte?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
                      } ,
                      child: const Text(
                        " Inscrivez vous!",
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
