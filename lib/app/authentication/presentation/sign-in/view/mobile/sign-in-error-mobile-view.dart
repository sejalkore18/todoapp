import 'package:clean_architecture_project/app/authentication/presentation/sign-in/sign-in-controller.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-in/view/widgets/signin-content-body.dart';
import 'package:flutter/material.dart';

class SignInErrorMobileView extends StatefulWidget {
  final SignInController controller;
  const SignInErrorMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  _SignInErrorMobileViewState createState() => _SignInErrorMobileViewState();
}

class _SignInErrorMobileViewState extends State<SignInErrorMobileView> {
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
              SignInContentBody(
                  emailTextController: _emailTextController,
                  passwordTextController: _passwordTextController,
                  controller: widget.controller),
              Text('Error')
            ],
          ),
        ));
  }
}
