import 'dart:async';
import 'package:clean_architecture_project/core/utility/firebase-keys.dart';
import 'package:clean_architecture_project/app/todo/domain/entity/todo-item-entity.dart';
import 'package:clean_architecture_project/app/todo/domain/repository/todo-repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TodoRespositoryImpl extends TodoRepository {
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // getCurrentUser() {
  //   if (_fireAuth.currentUser == null)
  //     throw ("Current user is NULL : TodoRepositoryImpl");
  //   else
  //     // return _fireAuth.currentUser!;
  //     return;
  // }

  @override
  Future<Stream<TodoItemEntity>> getTodoItems({required String userID}) async {
    StreamController<TodoItemEntity> _streamController = new StreamController();
    throw UnimplementedError();
  }

  @override
  Future<void> addTodoItem(
      {required String userID,
      required String title,
      required String description}) async {
    DocumentReference doc = await _firebaseFirestore
        .collection(FirebaseKeys.collectionKeyNameUsers)
        .doc(userID)
        .collection(FirebaseKeys.collectionKeyNameTodoList)
        .add({
      FirebaseKeys.keyNameTitle: title,
      FirebaseKeys.keyNameDescription: description,
      FirebaseKeys.keyNameTime: Timestamp.now()
    });
    await _firebaseFirestore
        .collection(FirebaseKeys.collectionKeyNameUsers)
        .doc(userID)
        .collection(FirebaseKeys.collectionKeyNameTodoList)
        .doc(doc.id)
        .set({
      FirebaseKeys.keyNameTitle: title,
      FirebaseKeys.keyNameDescription: description,
      FirebaseKeys.keyNameTime: Timestamp.now()
    });
  }

  @override
  Future<void> editTodoItem(
      {required String userID,
      required String itemID,
      required String title,
      required String description}) async {
    await _firebaseFirestore
        .collection(FirebaseKeys.collectionKeyNameUsers)
        .doc(userID)
        .collection(FirebaseKeys.collectionKeyNameTodoList)
        .doc(itemID)
        .set({
      FirebaseKeys.keyNameTitle: title,
      FirebaseKeys.keyNameDescription: description,
      FirebaseKeys.keyNameTime: Timestamp.now()
    });
  }
}

//Issues:
// 1. User ID = _fireAuth.currentUser---> Is this the way we use it..? I guess so...!
