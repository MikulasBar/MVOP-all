import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:satellite_tracker/router/app_router.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the app!'),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const InputRoute());
              },
              child: const Text('Go to Tracker'),
            ),
          ],
        ),
      ),
    );
  }
}