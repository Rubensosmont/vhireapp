import 'package:flutter/material.dart';

import '../../services/authentication.dart';

class PasswordForgetPage extends StatelessWidget {

  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mot de passe oublié'),
        backgroundColor: Colors.deepPurple, 
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
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Adresse e-mail',
                    border: const OutlineInputBorder(),
                    fillColor:
                        Colors.grey[200], 
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _auth.pwdReset(_emailController.text, context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text('Réinitialiser le mot de passe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
