class AuthenticatedUser {

  late String id;
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
}