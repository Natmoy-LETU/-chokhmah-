import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainApp();
}
  

class _MainApp extends State<MainApp>{
String dropDownValue = 'Method 1';

  @override
  Widget build(BuildContext context){
    return Center(
      child: Scaffold(
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