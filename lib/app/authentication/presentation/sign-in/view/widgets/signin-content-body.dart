import 'package:clean_architecture_project/app/authentication/presentation/sign-in/sign-in-controller.dart';
import 'package:flutter/material.dart';

class SignInContentBody extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Text("Sign In"),
        TextFormField(
          controller: emailTextController,
          decoration:
              InputDecoration(labelText: "Email", hintText: "abc@gmail.com"),
        ),
        TextFormField(
          controller: passwordTextController,
          decoration: InputDecoration(
            labelText: "Password",
          ),
        ),
        TextButton(
            onPressed: () {
              if (emailTextController.text.isNotEmpty &&
                  passwordTextController.text.isNotEmpty) {
                controller.userSignIn(
                    email: emailTextController.text,
                    password: passwordTextController.text);
              }
            },
            child: Text("Sign In")),
        TextButton(
            onPressed: () {
              controller.navigateToSignUp();
            },
            child: Text("Got To Sign Up")),
      ],
    );
  }
}
