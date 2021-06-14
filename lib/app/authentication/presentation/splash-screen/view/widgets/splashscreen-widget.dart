import 'package:clean_architecture_project/app/authentication/presentation/splash-screen/splash-screen-controller.dart';
import 'package:flutter/material.dart';

class SplashScreenWidget extends StatelessWidget {
  final SplashScreenController controller;

  const SplashScreenWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.checkUserSignIn();
    return Scaffold(
        body: Center(
      child: Icon(Icons.sanitizer),
    ));
  }
}
