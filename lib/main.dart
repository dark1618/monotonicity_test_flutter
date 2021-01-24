import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monotonicitytest/StartWidget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]); // Force landscape orientation
  runApp(MonotonicityTest()); // Run app
}

class MonotonicityTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Monotonitástűrés-teszt",
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: StartWidget(),
      ),
    );
  }
}