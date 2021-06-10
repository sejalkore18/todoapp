import 'package:clean_architecture_project/app/authentication/presentation/sign-in/view/sign-in-view.dart';
import 'package:clean_architecture_project/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String homePageRoute = '/home-page';
  static const String signInPageRoute = '/sign-in-page';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(),
          settings: RouteSettings(
            name: NavigationService.homePageRoute,
          ),
        );

      case signInPageRoute:
        return MaterialPageRoute(
          builder: (_) => SignInView(),
          settings: RouteSettings(
            name: NavigationService.signInPageRoute,
          ),
        );
      default:
        throw Exception("NavigationService: Invalid Navigation");
    }
  }

  void navigateBack() {
    return navigatorKey.currentState!.pop();
  }

  void navigationPopUntil(String untilRoute) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(untilRoute));
  }

  Future navigateTo(String route,
      {bool shouldReplace = false, Object? arguments}) async {
    if (shouldReplace) {
      return navigatorKey.currentState!
          .pushReplacementNamed(route, arguments: arguments);
    }
    return navigatorKey.currentState!.pushNamed(route, arguments: arguments);
  }
}
