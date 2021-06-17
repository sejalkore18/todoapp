import 'package:cloud_firestore/cloud_firestore.dart';

class TodoItemEntity {
  final String
      itemID; //Not sure of this kyunki yeh document ka id hi itemID hoga firebase mein
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

//TODO:
// Should it be final or not???
