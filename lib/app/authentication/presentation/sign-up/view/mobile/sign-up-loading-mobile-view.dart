import 'package:clean_architecture_project/app/authentication/presentation/sign-up/sign-up-controller.dart';
import 'package:flutter/material.dart';

class SignUpLoadingMobileView extends StatelessWidget {
  final SignUpController controller;
  const SignUpLoadingMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
