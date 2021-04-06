import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/dummy_page.dart';
import 'package:mobile/screens/start_page.dart';
import 'package:mobile/widgets/nav_drawer.dart';

class _Routes {
  static const String dummy = DummyPage.routeName;
  static const String home = StartPage.routeName;
}

class RouteGenerator {
  static Route<dynamic> generatorRoutes(RouteSettings settings) {
    //getting arguments passed may need this in the future
    final args = settings.arguments;
    switch (settings.name) {
      case _Routes.home:
        return MaterialPageRoute(builder: (context) => StartPage());
      case _Routes.dummy:
        return MaterialPageRoute(builder: (context) => DummyPage());
      default:
        return _errorRoute();
    }
  }

  //TODO revisit this
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: Text('Flutter App')),
        drawer: NavDrawer(),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
