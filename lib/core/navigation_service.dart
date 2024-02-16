import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static NavigationService? _instance;
  // Avoid self instance
  NavigationService._();
  static NavigationService get instance => _instance ??= NavigationService._();

  dynamic routeTo(String route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: arguments);
  }

  dynamic routeToPage(Widget page, {dynamic arguments, bool replace = false}) {
    var pageRoute = MaterialPageRoute(builder: (_) => page);
    if (replace) {
      return navigatorKey.currentState?.pushReplacement(pageRoute);
    }
    return navigatorKey.currentState?.push(pageRoute);
  }

  dynamic goBack() {
    return navigatorKey.currentState?.pop();
  }
}
