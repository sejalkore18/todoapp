import 'package:clean_architecture_project/app/authentication/presentation/sign-up/sign-up-controller.dart';
import 'package:flutter/material.dart';

class SignUpInitMobileView extends StatefulWidget {
  final SignUpController controller;
  const SignUpInitMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  _SignUpInitMobileViewState createState() => _SignUpInitMobileViewState();
}

class _SignUpInitMobileViewState extends State<SignUpInitMobileView> {
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
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          SizedBox(height: 100),
          Text("Sign Up"),
          TextFormField(
            controller: _emailTextController,
            decoration:
                InputDecoration(labelText: "Email", hintText: "abc@gmail.com"),
          ),
          TextFormField(
            controller: _passwordTextController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          TextButton(
              onPressed: () {
                if (_emailTextController.text.isNotEmpty &&
                    _passwordTextController.text.isNotEmpty) {
                  widget.controller.userSignUp(
                      email: _emailTextController.text,
                      password: _passwordTextController.text);
                }
              },
              child: Text("Sign Up"))
        ],
      ),
    ));
  }
}
