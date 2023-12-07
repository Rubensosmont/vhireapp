import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticatedUser {

  static final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  final String id;
  late String? lastname;
  late String? firstname;
  late String? email;
  late String? gender;
  late String? idcard;
  late String? license_id;

  // Constructor
  AuthenticatedUser({
    required this.id,
    this.firstname = "",
    this.email = "",
    this.lastname = "",
    this.gender = "",
    this.idcard = "",
    this.license_id = ""
  });

  // Function to update user's data
  Future update({String? lastname, String? firstname, String? email, String? gender, String? idcard, String? license_id}) async {

    if(lastname != null) {
      this.lastname = lastname;
    }
    if(firstname != null) {
      this.firstname = firstname;
    }
    if(email != null) {
      this.email = email;
    }
    if(gender != null) {
      this.gender = gender;
    }
    if(idcard != null) {
      this.idcard = idcard;
    }
    if(license_id != null) {
      this.license_id = license_id;
    }

    await userCollection.doc(id).set({
    "lastname": this.lastname,
    "firstname": this.firstname,
    "email": this.email,
    "gender": this.gender,
    "idcard": this.idcard,
    "license_id": this.license_id
    });
  }

}
