import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Positioned(
            height: 50,
            right: 75,
            child: ElevatedButton(
              onPressed: null,
              child: Text("Settings"),
              )
          )
        ),
      ),
    );
  }
}

