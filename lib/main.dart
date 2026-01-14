//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pantallas/models/digi_model.dart';
import 'package:pantallas/pages/about_page.dart';
import 'package:pantallas/pages/home_page.dart';
import 'package:pantallas/services/digi_service.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'about',
            builder: (BuildContext context, GoRouterState state) {
              return const AboutPage();
            })
      ]),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
