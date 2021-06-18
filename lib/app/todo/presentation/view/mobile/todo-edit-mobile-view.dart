import 'package:clean_architecture_project/app/todo/presentation/todo-controller.dart';
import 'package:flutter/material.dart';

class TodoEditMobileView extends StatefulWidget {
  final TodoController controller;
  const TodoEditMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  _TodoEditMobileViewState createState() => _TodoEditMobileViewState();
}

class _TodoEditMobileViewState extends State<TodoEditMobileView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
