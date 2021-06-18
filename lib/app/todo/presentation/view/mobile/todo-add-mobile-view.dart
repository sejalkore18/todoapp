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
  late TextEditingController _titleTextController;
  late TextEditingController _descriptionTextController;

  @override
  void initState() {
    _titleTextController = new TextEditingController();
    _descriptionTextController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Column(children: [
        SizedBox(height: 100),
        Text('Title'),
        SizedBox(height: 100),
        TextFormField(
          controller: _titleTextController,
          decoration:
              InputDecoration(labelText: "Title", hintText: "Add title..."),
        ),
        SizedBox(height: 100),
        Text('Description'),
        SizedBox(height: 100),
        TextFormField(
          controller: _descriptionTextController,
          decoration: InputDecoration(
              labelText: "Description", hintText: "Add description..."),
        ),
        TextButton(
            onPressed: () {
              if (_titleTextController.text.isNotEmpty &&
                  _descriptionTextController.text.isNotEmpty) {
                widget.controller.addTodo(
                    title: _titleTextController.text,
                    description: _descriptionTextController.text);
              }
            },
            child: Text("Add")),
      ])),
    );
    ;
  }
}
