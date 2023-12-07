import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginSteps1 extends StatefulWidget {
  const LoginSteps1({super.key});

  @override
  State<LoginSteps1> createState() => _LoginSteps1State();
}

class _LoginSteps1State extends State<LoginSteps1> {
  final formKey = new GlobalKey<FormState>();
  String? _sexe;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child:
        Center(
          child: Column(

            children: [
              Padding(padding: EdgeInsets.all(30)),
              Text("Continuez votre inscription", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20)),
              Container(
                width: 340,
                height: 500,

                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10 * 0.2, ),
                decoration: BoxDecoration(
                    color: Colors.cyan[100],
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child:            Column(
                  children: [
                    Center(
                      child: Image.asset("assets/images/vhirelogo.png",height: 150,),
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Container(

                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Numéro de carte d'identité"
                                ),validator: (String? value){
                                return (value == null || value == "") ?
                                "Ce champ est obligatoire": null;
                              },
                              )

                              ,
                            ),
                            SizedBox(height: 20,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Numéro de permis de conduire"
                                ), validator: (String? value){
                                return (value == null || value == "") ?
                                "Ce champ est obligatoire": null;
                              },
                              ),
                            ),
                            SizedBox(height: 20,),


                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child:   DropdownButtonFormField(style :TextStyle(color: Colors.white
                              ),decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Quel est votre sexe',
                              ),
                                value: _sexe,
                                onChanged: (String? v)async{
                                  setState(() {
                                    _sexe = v;
                                  });
                                },
                                items: <String>['Masculin','Féminin','Autre','Croissant'].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, style:TextStyle(color: Colors.black),),
                                  );
                                }).toList(),
                                validator: (str) => str == null ? "Ce champ est obligatoire" : null,
                              ),


                            ),

                          ],
                        )
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Notification'),
                                content: const Text('Inscrit'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text("Valider"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size.fromWidth(200)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              )


            ],
          ),



        )
      )


    );
  }
}
