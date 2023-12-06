class AuthenticatedUser {

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
    this.firstname,
    this.email,
    this.lastname,
    this.gender,
    this.idcard,
    this.license_id
  });

  // Function to update users informations
  Future update({String? lastname, String? firstname, String? email, String? gender, String? idcard, String? license_id}) async {
    // Nothing yet
  }
}