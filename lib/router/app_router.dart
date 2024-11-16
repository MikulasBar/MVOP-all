

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:satellite_tracker/screens/welcome_screen.dart';
import 'package:satellite_tracker/screens/input_screen.dart';
import 'package:satellite_tracker/screens/output_screen.dart';


part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: WelcomeRoute.page, initial: true),
    AutoRoute(page: InputRoute.page),
    AutoRoute(page: OutputRoute.page),
  ];
}
