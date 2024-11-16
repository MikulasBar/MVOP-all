import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:satellite_tracker/api/sattelite_api.dart';
import 'package:satellite_tracker/model/sattelite_info.dart';

@RoutePage()
class OutputScreen extends StatelessWidget {
  const OutputScreen({
    super.key,
    required this.satelliteId,
    required this.visible,
  });

  final String satelliteId;
  final bool visible;

  String getTimeFromUTC(DateTime utc) {
    List<int> utc_parts = [
      utc.year,
      utc.month,
      utc.day,
      utc.hour,
      utc.minute,
    ];

    final formated = utc_parts
      .map((part) => part.toString().padLeft(2, '0'))
      .toList();

    final time = '${formated[0]}-${formated[1]}-${formated[2]} ${formated[3]}:${formated[4]}';
    return time;
  }

  Widget eventSection(SatteliteEvent event) {
    final time = getTimeFromUTC(event.utcDatetime);
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time: $time',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Icon(
                  event.visible ? Icons.visibility : Icons.visibility_off,
                  color: event.visible ? Colors.green : Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Azimuth: ${event.azimuth}°'),
                Text('Altitude: ${event.alt}°'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget infoScreen(BuildContext ctx, SatteliteInfo info) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: const EdgeInsets.only(bottom: 24),
            color: Theme.of(ctx).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Satellite ID: ${info.id}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Icon(
                    info.visible ? Icons.visibility : Icons.visibility_off,
                    color: info.visible ? Colors.green : Colors.grey,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Rise',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          eventSection(info.rise),
          const Text(
            'Culmination',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          eventSection(info.culmination),
          const Text(
            'Set',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          eventSection(info.set),
        ],
      ),
    );
  }

  Widget loadingScreen() {
    return Container(
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }

  Widget errorScreen(Object error) {
    return Container(
      alignment: Alignment.center,
      child: Text('Error: $error'),
    );
  } 

  @override
  Widget build(BuildContext context) {
    final satelliteInfoFuture =
        SatteliteApi.fetchSatelliteInfo(satelliteId, visible);

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: satelliteInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingScreen();
          } else if (snapshot.hasError) {
            return errorScreen(snapshot.error!);
          }

          final info = snapshot.data as SatteliteInfo;
          return infoScreen(context, info);
        },
      ),
    );
  }
}
