import 'package:clean_architecture_project/app/authentication/presentation/sign-in/sign-in-controller.dart';
import 'package:flutter/material.dart';

class SignInContentBody extends StatefulWidget {
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final SignInController controller;

  const SignInContentBody(
      {Key? key,
      required this.emailTextController,
      required this.passwordTextController,
      required this.controller})
      : super(key: key);

  @override
  _SignInContentBodyState createState() => _SignInContentBodyState();
}

class _SignInContentBodyState extends State<SignInContentBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Text("Sign In"),
        TextFormField(
          controller: widget.emailTextController,
          decoration:
              InputDecoration(labelText: "Email", hintText: "abc@gmail.com"),
        ),
        TextFormField(
          controller: widget.passwordTextController,
          decoration: InputDecoration(
            labelText: "Password",
          ),
        ),
        TextButton(
            onPressed: () {
              if (widget.emailTextController.text.isNotEmpty &&
                  widget.passwordTextController.text.isNotEmpty) {
                widget.controller.userSignIn(
                    email: widget.emailTextController.text,
                    password: widget.passwordTextController.text);
              }
            },
            child: Text("Sign In")),
        TextButton(
            onPressed: () {
              widget.controller.navigateToSignUp();
            },
            child: Text("Got To Sign Up")),
      ],
    );
  }
}
