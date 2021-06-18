import 'package:clean_architecture_project/app/todo/presentation/todo-controller.dart';
import 'package:flutter/material.dart';

class TodoErrorMobileView extends StatefulWidget {
  final TodoController controller;
  const TodoErrorMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  _TodoErrorMobileViewState createState() => _TodoErrorMobileViewState();
}

class _TodoErrorMobileViewState extends State<TodoErrorMobileView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
