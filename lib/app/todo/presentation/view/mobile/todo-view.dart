import 'package:clean_architecture_project/app/todo/presentation/todo-controller.dart';
import 'package:clean_architecture_project/app/todo/presentation/todo-state-machine.dart';
import 'package:clean_architecture_project/app/todo/presentation/view/mobile/todo-add-mobile-view.dart';
import 'package:clean_architecture_project/app/todo/presentation/view/mobile/todo-edit-mobile-view.dart';
import 'package:clean_architecture_project/app/todo/presentation/view/mobile/todo-error-mobile-view.dart';
import 'package:clean_architecture_project/app/todo/presentation/view/mobile/todo-init-mobile-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class TodoView extends View {
  @override
  State<StatefulWidget> createState() => TodoViewState();
}

class TodoViewState extends ResponsiveViewState<TodoView, TodoController> {
  TodoViewState() : super(new TodoController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<TodoController>(
        builder: (context, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;
      print("Mobile View Called With State $currentStateType");

      switch (currentStateType) {
        case TodoInitializationState:
          return TodoLoadingView(
            controller: controller,
          );

        case TodoInitState:
          return TodoInitMobileView(
            controller: controller,
          );

        case TodoAddState:
          return TodoAddMobileView(
            controller: controller,
          );

        case TodoErrorState:
          return TodoErrorMobileView(
            controller: controller,
          );

        case TodoEditState:
          return TodoEditMobileView(
            controller: controller,
          );

        default:
          throw Exception("Unknown State: $currentStateType: TodoView");
      }
    });
  }

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}
