import 'package:flutter/material.dart';

class SettingsFrame extends StatefulWidget {
  const SettingsFrame({super.key});

  @override
  State<SettingsFrame> createState() => _SettingsFrame();
}
  

class _SettingsFrame extends State<SettingsFrame>{
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