import 'package:clean_architecture_project/app/todo/presentation/todo-controller.dart';
import 'package:flutter/material.dart';

class TodoAddMobileView extends StatefulWidget {
  final TodoController controller;
  const TodoAddMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  _TodoAddMobileViewState createState() => _TodoAddMobileViewState();
}

class _TodoAddMobileViewState extends State<TodoAddMobileView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
