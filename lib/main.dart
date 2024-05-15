import 'package:flutter/material.dart';
import 'joins_calculator.dart'; // Make sure to import the joins_calculator.dart file

void main() {
  runApp(const SurveyorToolsApp());
}

class SurveyorToolsApp extends StatelessWidget {
  const SurveyorToolsApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Surveyor Tools',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SurveyorToolsHomePage(),
    );
  }
}

class SurveyorToolsHomePage extends StatefulWidget {
  const SurveyorToolsHomePage({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SurveyorToolsHomePageState createState() => _SurveyorToolsHomePageState();
}

class _SurveyorToolsHomePageState extends State<SurveyorToolsHomePage> {
  TextEditingController x1Controller = TextEditingController();
  TextEditingController y1Controller = TextEditingController();
  TextEditingController x2Controller = TextEditingController();
  TextEditingController y2Controller = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  TextEditingController directionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Surveyor Tools - v1.0.0',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            fontFamily: 'Lato',
          ),
        ),
        // Center the title in the app bar
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Heading: Joins
          const Text(
            'Joins',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Input fields for first set of coordinates
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: x1Controller,
                  decoration: const InputDecoration(
                    labelText: 'First set: X coordinate',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: y1Controller,
                  decoration: const InputDecoration(
                    labelText: 'First set: Y coordinate',
                  ),
                ),
              ],
            ),
          ),
          // Input fields for second set of coordinates
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: x2Controller,
                  decoration: const InputDecoration(
                    labelText: 'Second set: X coordinate',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: y2Controller,
                  decoration: const InputDecoration(
                    labelText: 'Second set: Y coordinate',
                  ),
                ),
              ],
            ),
          ),
          // Button: Get Join
          ElevatedButton(
            onPressed: () {
              double x1 = double.tryParse(x1Controller.text) ?? 0.0;
              double y1 = double.tryParse(y1Controller.text) ?? 0.0;
              double x2 = double.tryParse(x2Controller.text) ?? 0.0;
              double y2 = double.tryParse(y2Controller.text) ?? 0.0;

              print('x1: $x1, y1: $y1, x2: $x2, y2: $y2');

              // Calculate distance and direction
              double distance =
                  JoinsCalculator.calculateDistance(x1, y1, x2, y2);
              String direction =
                  JoinsCalculator.calculateDirection(x1, y1, x2, y2);

              print('distance: $distance, direction: $direction');

              // Update text fields with the calculated values
              setState(() {
                distanceController.text = distance.toStringAsFixed(3);
                directionController.text = direction;
              });
            },
            child: const Text('Get Join'),
          ),
          // Output fields for distance and direction
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: distanceController,
                  decoration: const InputDecoration(
                    labelText: 'Distance',
                  ),
                  enabled: false,
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: directionController,
                  decoration: const InputDecoration(
                    labelText: 'Direction',
                  ),
                  enabled: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
