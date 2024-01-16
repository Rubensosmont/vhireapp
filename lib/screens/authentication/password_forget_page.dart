import 'package:flutter/material.dart';
import 'package:vhireapp/services/authentication.dart';
import 'package:vhireapp/shared/error.dart';

class PasswordForgetPage extends StatelessWidget {

  PasswordForgetPage({super.key});

  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  String textShown = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Mot de passe oublié'),
        backgroundColor: const Color(0xFF5371E9),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Entrez votre adresse e-mail pour réinitialiser votre mot de passe',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
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

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () async {
                    dynamic result = await _auth.pwdReset(_emailController.text);
                    if(result is CustomError) {
                      textShown = result.message;
                    } else {
                      textShown = result;
                    }
                    showDialog(context: context, builder: (BuildContext context) {
                      return AlertDialog(content: Text(textShown));
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration( color: const Color(0xFF5371E9),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text(
                        "Réinitialiser le mot de passe",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
