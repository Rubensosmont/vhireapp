import 'package:cloud_firestore/cloud_firestore.dart';

class Agency {

  static final CollectionReference agencyCollection = FirebaseFirestore.instance.collection("agencies");

  final String id;
  late String name;
  late GeoPoint localisation;
  late double? note;

  // Constructor
  Agency({
    required this.id,
    required this.name,
    required this.localisation,
    this.note,
  });


}
