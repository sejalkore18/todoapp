import 'package:clean_architecture_project/app/authentication/presentation/sign-up/sign-up-controller.dart';
import 'package:flutter/material.dart';

class SignUpInitMobileView extends StatelessWidget {
  final SignUpController controller;
  const SignUpInitMobileView({Key? key, required this.controller})
      : super(key: key);

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
            decoration:
                InputDecoration(labelText: "Email", hintText: "abc@gmail.com"),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          TextButton(onPressed: () {}, child: Text("Sign Up"))
        ],
      ),
    ));
  }
}
