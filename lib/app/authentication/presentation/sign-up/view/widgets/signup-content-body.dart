import 'package:clean_architecture_project/app/authentication/presentation/sign-up/sign-up-controller.dart';
import 'package:flutter/material.dart';

class SignUpContentBody extends StatelessWidget {
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final SignUpController controller;

  const SignUpContentBody(
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
        Text("Sign Up"),
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
                controller.userSignUp(
                    email: emailTextController.text,
                    password: passwordTextController.text);
              }
            },
            child: Text("Sign Up"))
      ],
    );
  }
}
