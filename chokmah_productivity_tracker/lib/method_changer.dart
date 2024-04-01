import 'package:flutter/material.dart';



class MethodMenu extends StatelessWidget {
  MethodMenu({Key? key, required this.title}) : super(key: key);
  final String title;
  String methodValue = 'Method 1';
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
                methodValue = "Method 1";
              },
              child: const Text('Method 1'),
            ),
            ElevatedButton(
              onPressed: () {
                methodValue = "Method 2";
              },
              child: const Text('Method 2'),
            ),
            ElevatedButton(
              onPressed: () {
                methodValue = "Method 3";
              },
              child: const Text('Method 3'),
            ),
          ],
        ),
      ),
    );
  }
}
