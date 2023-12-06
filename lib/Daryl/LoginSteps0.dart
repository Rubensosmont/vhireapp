import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginSteps1.dart';


class LoginSteps0 extends StatefulWidget {
  const LoginSteps0({super.key});

  @override
  State<LoginSteps0> createState() => _LoginSteps0State();
}

class _LoginSteps0State extends State<LoginSteps0> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
          child: Center(
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
                                        hintText: "Nom"
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
                                        hintText: "Prénom"
                                    ), validator: (String? value){
                                    return (value == null || value == "") ?
                                    "Ce champ est obligatoire": null;
                                  },
                                  ),
                                ),
                                SizedBox(height: 20,),


                                ElevatedButton(
                                  onPressed: () {

                                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSteps1()),

                                    );
                                  }
                                  ,
                                  child: Text("Suivant"),
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

                  ]
              )
          ),
        )
    );
  }
}
