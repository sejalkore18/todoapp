import 'package:flutter/material.dart';

class SignInErrorMobileView extends StatelessWidget {
  const SignInErrorMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          SizedBox(height: 100),
          Text("Sign In"),
          TextFormField(
            decoration:
                InputDecoration(labelText: "Email", hintText: "abc@gmail.com"),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          TextButton(onPressed: () {}, child: Text("Sign In"))
        ],
      ),
    ));
  }
}
