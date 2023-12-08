import 'package:flutter/material.dart';
import 'new_pwd.dart';

class PasswordForgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mot de passe oublié'),
        backgroundColor: Colors.deepPurple, 
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Entrez votre adresse e-mail pour réinitialiser votre mot de passe',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Adresse e-mail',
                    border: OutlineInputBorder(),
                    fillColor:
                        Colors.grey[200], 
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewPasswordPage()),
                  );
                },
                child: Text('Réinitialiser le mot de passe'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
