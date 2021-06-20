import 'package:clean_architecture_project/app/todo/presentation/todo-controller.dart';
import 'package:flutter/material.dart';

class TodoLoadingMobileView extends StatefulWidget {
  final TodoController controller;
  const TodoLoadingMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  _TodoLoadingMobileViewState createState() => _TodoLoadingMobileViewState();
}

class _TodoLoadingMobileViewState extends State<TodoLoadingMobileView> {
  @override
  Widget build(BuildContext context) {
    widget.controller.getTodo();
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
