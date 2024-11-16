import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:satellite_tracker/router/app_router.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    
    Geolocator.requestPermission();

    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }
}
