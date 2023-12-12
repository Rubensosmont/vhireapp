import 'package:cloud_firestore/cloud_firestore.dart';

class Reservation {

  static final CollectionReference reservationCollection = FirebaseFirestore.instance.collection("reservations");

  final String id;
  final String user_id;
  final String vehicle_id;
  final Timestamp begin_at;
  late Timestamp finish_at;
  late String status;
  late int montant;
  late int? transaction_id;

  // Constructor
  Reservation({
    required this.id,
    required this.user_id,
    required this.vehicle_id,
    required this.begin_at,
    required this.finish_at,
    required this.status,
    this.transaction_id
  }) {
    montant = 100000;
  }

}
