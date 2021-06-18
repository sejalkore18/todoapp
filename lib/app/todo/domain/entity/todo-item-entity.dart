import 'package:cloud_firestore/cloud_firestore.dart';

class TodoItemEntity {
  final String itemID;
  final String title;
  final String description;
  final Timestamp time;

  TodoItemEntity({
    required this.itemID,
    required this.title,
    required this.description,
    required this.time,
  });
}
