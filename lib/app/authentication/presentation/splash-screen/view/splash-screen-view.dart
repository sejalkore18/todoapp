import 'package:clean_architecture_project/app/authentication/presentation/splash-screen/splash-screen-controller.dart';
import 'package:clean_architecture_project/app/authentication/presentation/splash-screen/splash-screen-state-machine.dart';
import 'package:clean_architecture_project/app/authentication/presentation/splash-screen/view/widgets/splashscreen-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SplashScreenView extends View {
  @override
  State<StatefulWidget> createState() => SplashScreenViewState();
}

class SplashScreenViewState
    extends ResponsiveViewState<SplashScreenView, SplashScreenController> {
  SplashScreenViewState() : super(new SplashScreenController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<SplashScreenController>(
        builder: (context, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;

      switch (currentStateType) {
        case SplashScreenInitializationState:
          return SplashScreenWidget(
            controller: controller,
          );

        default:
          throw Exception('Invalid State $currentStateType : SplashScreenView');
      }
    });
  }

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}
