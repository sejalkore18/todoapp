import 'package:clean_architecture_project/app/authentication/presentation/sign-up/sign-up-controller.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-up/sign-up-state-machine.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-up/view/mobile/sign-up-error-mobile-view.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-up/view/mobile/sign-up-init-mobile-view.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-up/view/mobile/sign-up-loading-mobile-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignUpView extends View {
  @override
  State<StatefulWidget> createState() => SignUpViewState();
}

class SignUpViewState
    extends ResponsiveViewState<SignUpView, SignUpController> {
  SignUpViewState() : super(new SignUpController());

  @override
  Widget get desktopView => throw UnimplementedError();
  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<SignUpController>(
      builder: (context, controller) {
        final currentStateType = controller.getCurrentState().runtimeType;
        print("Mobile View Called With State $currentStateType");

        switch (currentStateType) {
          case SignUpInitState:
            return SignUpInitMobileView(
              controller: controller,
            );

          case SignUpLoadingState:
            return SignUpLoadingMobileView(
              controller: controller,
            );

          case SignUpErrorState:
            return SignUpErrorMobileView(
              controller: controller,
            );

          default:
            throw Exception("Unknown State: $currentStateType: SignUpView");
        }
      },
    );
  }

  @override
  Widget get tabletView => throw UnimplementedError();
  @override
  Widget get watchView => throw UnimplementedError();
}
