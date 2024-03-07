import 'package:flutter/material.dart';
import 'package:provider_mvvm/utils/routs/routs_name.dart';
import 'package:provider_mvvm/view/home_screen.dart';
import 'package:provider_mvvm/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutsName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutsName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(child: Text('no routes define')),
          );
        });
    }
  }
}
