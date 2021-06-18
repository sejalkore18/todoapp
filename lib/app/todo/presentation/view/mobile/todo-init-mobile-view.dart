import 'package:clean_architecture_project/app/todo/presentation/todo-controller.dart';
import 'package:flutter/material.dart';

class TodoInitMobileView extends StatefulWidget {
  final TodoController controller;
  const TodoInitMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  _TodoInitMobileViewState createState() => _TodoInitMobileViewState();
}

class _TodoInitMobileViewState extends State<TodoInitMobileView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
