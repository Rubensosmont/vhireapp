import 'package:flutter/material.dart';
import 'package:vhireapp/screens/authentication/signup_step1.dart';

class SignupStep0 extends StatefulWidget {
  const SignupStep0({super.key});

  @override
  State<SignupStep0> createState() => _SignupStep0State();
}

class _SignupStep0State extends State<SignupStep0> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading:   Row(

          children: [
            Expanded(child:  IconButton(onPressed:  (){
              //This is useless //Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStep0()));
            }, icon: const Icon(Icons.arrow_back,color: Colors.black,size: 30,),alignment: Alignment.topLeft,))
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Padding(padding: const EdgeInsets.only(left: 30.0),
                child: Image.asset("assets/images/vhire.png",height: 200,),
              ),

          const SizedBox(height: 75,),
          //Welcome section
          const Text("inscription",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
                color: Color(0xFF5371E9)
            ),
          ),
          const SizedBox(height:10,),
          const Text('Entrer vos informations',
            style: TextStyle(
                fontSize: 18),
          ),
              const SizedBox(height: 30,),
          Form(
              key: formKey,
              child: Column(
            children: [
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
                    child: TextFormField(
                      controller: _nameController,

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nom',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),validator: (String? value){
                      return (value == null || value == "") ?
                      "Ce champ est obligatoire": null;
                    },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
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
                    child: TextFormField(

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Prénom',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),validator: (String? value){
                      return (value == null || value == "") ?
                      "Ce champ est obligatoire": null;
                    },
                    ),
                  ),
                ),
              ),

            ],
          )
          ),
              const SizedBox(height: 30,),
          // Email text field
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStep1()),

                    );
                  }

                }
                ,
                child: const Text("Suivant"),
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(const Color(0xFF5371E9)),
                  fixedSize: MaterialStateProperty.all(const Size.fromWidth(200)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // Adjust the radius as needed
                    ),
                  ),
                ),
              ),

              //
          ]
        )
      ),
      ),

    );
  }
}
