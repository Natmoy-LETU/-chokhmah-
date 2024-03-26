import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainApp();
}
  

class _MainApp extends State<MainApp>{
String dropDownValue = 'Method 1';

  @override
  Widget build(BuildContext context){
    return Center(
     child: Positioned(
      bottom: 50,
      left: 75,
      child: DropdownButton<String>(
        value: dropDownValue,
        icon: const Icon(Icons.menu),
        style: const TextStyle(color: Colors.white),
        underline: Container(
          height: 2,
          color: Colors.white,
        ),
        onChanged: (String? newValue){
          setState(() {
            dropDownValue = newValue!;
          });
        },
        items: const [
          DropdownMenuItem<String>(
            value: 'Method 1',
            child: Text('Method 1'),  
          ),
          DropdownMenuItem<String>(
            value: 'Method 2',
            child: Text('Method 2'),  
          ),
          DropdownMenuItem<String>(
            value: 'Method 3',
            child: Text('Method 3'),  
          ),
        ] 
      ),
     )
    );
  }
}