import 'dart:async';
import 'package:clean_architecture_project/core/utility/firebase-keys.dart';
import 'package:clean_architecture_project/app/todo/domain/entity/todo-item-entity.dart';
import 'package:clean_architecture_project/app/todo/domain/repository/todo-repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TodoRespositoryImpl extends TodoRepository {
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  User getCurrentUser() {
    if (_fireAuth.currentUser == null)
      throw ("Current user is NULL : TodoRepositoryImpl");
    else
      return _fireAuth.currentUser!;
  }

  @override
  Future<List<TodoItemEntity>> getTodoItems() async {
    User user = getCurrentUser();

    List<TodoItemEntity> todoList = [];

    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection(FirebaseKeys.collectionKeyNameUsers)
        .doc(user.uid)
        .collection(FirebaseKeys.collectionKeyNameTodoList)
        .get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      todoList.add(new TodoItemEntity(
          itemID: querySnapshot.docs[i].id,
          title: querySnapshot.docs[i][FirebaseKeys.keyNameTitle],
          description: querySnapshot.docs[i][FirebaseKeys.keyNameDescription],
          time: Timestamp.now()));
    }
    return todoList;
  }

  @override
  Future<void> addTodoItem(
      {required String title, required String description}) async {
    User user = getCurrentUser();

    await _firebaseFirestore
        .collection(FirebaseKeys.collectionKeyNameUsers)
        .doc(user.uid)
        .collection(FirebaseKeys.collectionKeyNameTodoList)
        .add({
      FirebaseKeys.keyNameTitle: title,
      FirebaseKeys.keyNameDescription: description,
      FirebaseKeys.keyNameTime: Timestamp.now()
    });
  }

  @override
  Future<void> editTodoItem(
      {required String itemID,
      required String title,
      required String description}) async {
    User user = getCurrentUser();

    await _firebaseFirestore
        .collection(FirebaseKeys.collectionKeyNameUsers)
        .doc(user.uid)
        .collection(FirebaseKeys.collectionKeyNameTodoList)
        .doc(itemID)
        .set({
      FirebaseKeys.keyNameTitle: title,
      FirebaseKeys.keyNameDescription: description,
      FirebaseKeys.keyNameTime: Timestamp.now()
    });
  }
}
