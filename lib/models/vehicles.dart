import 'package:cloud_firestore/cloud_firestore.dart';

class Vehicle {

  static final CollectionReference vehicleCollection = FirebaseFirestore.instance.collection("vehicles");

  final String id;
  final String agency_id;
  late String brand;
  late String model;
  late String type;
  late int price;
  late String status;
  late Timestamp? limit_date;

  // Constructor
  Vehicle({
    required this.id,
    required this.agency_id,
    required this.brand,
    required this.model,
    required this.type,
    required this.price,
    required this.status,
    this.limit_date
  });

}
