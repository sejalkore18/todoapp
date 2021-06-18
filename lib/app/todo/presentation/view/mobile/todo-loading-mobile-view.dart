import 'package:clean_architecture_project/app/todo/presentation/todo-controller.dart';
import 'package:flutter/material.dart';

class TodoLoadingView extends StatefulWidget {
  final TodoController controller;
  const TodoLoadingView({Key? key, required this.controller}) : super(key: key);

  @override
  _TodoLoadingViewState createState() => _TodoLoadingViewState();
}

class _TodoLoadingViewState extends State<TodoLoadingView> {
  //idhar ek function aayega
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
