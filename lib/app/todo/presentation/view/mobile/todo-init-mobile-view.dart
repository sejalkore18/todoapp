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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          // StreamBuilder<List<dynamic>>(
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: CircularProgressIndicator());
          //     }

          //     if (!snapshot.hasData) {
          //       return Center(child: Text('no data!'));
          //     }

          //     final activeTodos = snapshot.data!;

          //     return ListView.builder(
          //       itemCount: activeTodos.length,
          //       itemBuilder: (context, index) {
          //         return Container(
          //           height: 50,
          //           width: 100,
          //           color: Colors.red,
          //         );
          //       },
          //     );
          //   },
          // ),

          Container(
        child: _todoInitState.itemList.isEmpty
            ? Column(
                children: [
                  Center(child: Text('Click the button to Add Todos')),
                  TextButton(
                      onPressed: () {
                        widget.controller.getSqlTodo();
                      },
                      child: Text("Get Todo console"))
                ],
              )
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
