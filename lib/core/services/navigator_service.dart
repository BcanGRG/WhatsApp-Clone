import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<dynamic> navigateTo(Widget route) => _navigatorKey.currentState!
      .push(MaterialPageRoute(builder: (context) => route));
  Future<dynamic> navigateToReplace(Widget route) => _navigatorKey.currentState!
      .pushReplacement(MaterialPageRoute(builder: (context) => route));
}
