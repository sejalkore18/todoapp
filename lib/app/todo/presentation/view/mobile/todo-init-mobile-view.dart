import 'package:clean_architecture_project/app/todo/presentation/todo-controller.dart';
import 'package:clean_architecture_project/app/todo/presentation/todo-state-machine.dart';
import 'package:flutter/material.dart';

class TodoInitMobileView extends StatefulWidget {
  final TodoController controller;
  const TodoInitMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  _TodoInitMobileViewState createState() => _TodoInitMobileViewState();
}

class _TodoInitMobileViewState extends State<TodoInitMobileView> {
  late TodoInitState _todoInitState;

  @override
  void initState() {
    _todoInitState = widget.controller.getCurrentState() as TodoInitState;
    // _todoInitState.itemList se fetch hoga yehhhhh lalalalala
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        //Display karna haiiiiii mujheeee
        child: _todoInitState.itemList.isEmpty
            ? Center(child: Text('Click the button to Add Todos'))
            : ListView.builder(
                itemCount: _todoInitState.itemList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text('${_todoInitState.itemList[index].title}'),
                      subtitle:
                          Text('${_todoInitState.itemList[index].description}'),
                      trailing: Text('${_todoInitState.itemList[index].time}'),
                      onLongPress: () => {
                            widget.controller.openEditDialog(
                                itemID: _todoInitState.itemList[index].itemID,
                                title: _todoInitState.itemList[index].title,
                                description:
                                    _todoInitState.itemList[index].description),
                          });
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.controller.openAddDialog();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
