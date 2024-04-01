import 'package:flutter/material.dart';






class Settings extends StatelessWidget {
  const Settings({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('A Setting'),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('A Differnt Setting'),
            ),
          ],
        ),
      ),
    );
  }
}
