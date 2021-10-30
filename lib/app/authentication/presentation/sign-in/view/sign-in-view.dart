import 'package:clean_architecture_project/app/authentication/presentation/sign-in/sign-in-controller.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-in/sign-in-state-machine.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-in/view/mobile/sign-in-error-mobile-view.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-in/view/mobile/sign-in-init-mobile-view.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-in/view/mobile/sign-in-loading-mobile-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignInView extends View {
  @override
  State<StatefulWidget> createState() => SignInViewState();
}

class SignInViewState
    extends ResponsiveViewState<SignInView, SignInController> {
  SignInViewState() : super(new SignInController());

  @override
  Widget get desktopView => mobileView;

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<SignInController>(
      builder: (context, controller) {
        final currentStateType = controller.getCurrentState().runtimeType;
        print("Mobile View Called With State $currentStateType");

        switch (currentStateType) {
          case SignInInitState:
            return SignInInitMobileView(
              controller: controller,
            );

          case SignInLoadingState:
            return SignInLoadingMobileView(
              controller: controller,
            );

          case SignInErrorState:
            return SignInErrorMobileView(
              controller: controller,
            );

          default:
            throw Exception("Unknown State: $currentStateType: SignInView");
        }
      },
    );
  }

  @override
  Widget get tabletView => mobileView;

  @override
  Widget get watchView => mobileView;
}
