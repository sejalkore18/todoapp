import 'package:clean_architecture_project/app/authentication/presentation/sign-up/sign-up-controller.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-up/view/widgets/signup-content-body.dart';
import 'package:flutter/material.dart';

class SignUpErrorMobileView extends StatefulWidget {
  final SignUpController controller;
  const SignUpErrorMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  _SignUpErrorMobileViewState createState() => _SignUpErrorMobileViewState();
}

class _SignUpErrorMobileViewState extends State<SignUpErrorMobileView> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    _emailTextController = new TextEditingController();
    _passwordTextController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              SignUpContentBody(
                  emailTextController: _emailTextController,
                  passwordTextController: _passwordTextController,
                  controller: widget.controller),
              Text("Error")
            ],
          ),
        ));
  }
}
