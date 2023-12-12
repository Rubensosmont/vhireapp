import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {

  static final CollectionReference commentCollection = FirebaseFirestore.instance.collection("comments");

  final String id;
  final String user_id;
  final String vehicle_id;
  late String? content;
  final Timestamp created_at;
  late Timestamp? deleted_at;
  late double? note;

  // Constructor
  Comment({
    required this.id,
    required this.user_id,
    required this.vehicle_id,
    this.content,
    required this.created_at,
    this.deleted_at,
    this.note
  });
  
}
