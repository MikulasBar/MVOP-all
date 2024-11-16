import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:satellite_tracker/router/app_router.dart';

@RoutePage()
class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  late TextEditingController satelliteIdController;
  late bool visible;

  @override
  void initState() {
    super.initState();
    satelliteIdController = TextEditingController();
    visible = false;
  }

  void changeVisibility(bool value) {
    setState(() {
      visible = value;
    });
  }

  String get satelliteId => satelliteIdController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: satelliteIdController,
                decoration: const InputDecoration(
                  labelText: 'Enter satellite ID',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('Visible:', style: TextStyle(fontSize: 15)),
                  const SizedBox(width: 10),
                  Switch(
                    value: visible,
                    onChanged: changeVisibility,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context)
                      .push(OutputRoute(satelliteId: satelliteId, visible: visible));
                },
                child: const Text('Track Satellite'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
