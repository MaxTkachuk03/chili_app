import 'package:chili_app/pages/pages.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter._();

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    //final Object? argument = settings.arguments;

    switch (settings.name) {
      case EnterPage.routeName:
        builder = (_) => const EnterPage();
        break;
      case HomePage.routeName:
        builder = (_) => const HomePage();
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  
  }
}
