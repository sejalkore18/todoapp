import 'package:cloud_firestore/cloud_firestore.dart';

class TodoItemEntity {
  final String itemID;
  final String title;
  final String description;
  final Timestamp? time;

  TodoItemEntity({
    required this.itemID,
    required this.title,
    required this.description,
    required this.time,
  });

  static TodoItemEntity fromMap({required Map<String, dynamic> data}) {
    return TodoItemEntity(
        itemID: data['itemId'],
        title: data['title'],
        description: data['description'],
        time: data['time']);
  }
}
