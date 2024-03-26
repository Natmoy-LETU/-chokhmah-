import 'package:flutter/material.dart'; 

void main() { 
runApp(const MyApp()); 
} 

class MyApp extends StatelessWidget { 
const MyApp({Key? key}) : super(key: key); 
@override 
Widget build(BuildContext context) { 
	return MaterialApp( 
	title: 'Flutter DropDownButton', 
	theme: ThemeData( 
		primarySwatch: Colors.green, 
	), 
	home: const MyHomePage(), 
	debugShowCheckedModeBanner: false, 
	); 
} 
} 

class MyHomePage extends StatefulWidget { 
const MyHomePage({Key? key}) : super(key: key); 

@override 
_MyHomePageState createState() => _MyHomePageState(); 
} 

class _MyHomePageState extends State<MyHomePage> { 
	
// Initial Selected Value 
String dropdownvalue = 'Method 1'; 

// List of items in our dropdown menu 
var items = [	 
	'Method 1', 
	'Method 2', 
	'Method 3', 
	'Method 4', 
	'Method 5', 
]; 
@override 
Widget build(BuildContext context) { 
	return Scaffold( 
	appBar: AppBar( 
		title: const Text("chokhmah"), 
	), 
	body: Positioned( 
    
      height: 0,
      right: 25,
		child: Column( 
		//mainAxisAlignment: MainAxisAlignment.center, 
		children: [ 
			DropdownButton( 
				
			// Initial Value 
			value: dropdownvalue, 
				
			// Down Arrow Icon 
			icon: const Icon(Icons.keyboard_arrow_down),	 
				
			// Array list of items 
			items: items.map((String items) { 
				return DropdownMenuItem( 
				value: items, 
				child: Text(items), 
				); 
			}).toList(), 
			// After selecting the desired option,it will 
			// change button value to selected value 
			onChanged: (String? newValue) { 
				setState(() { 
				dropdownvalue = newValue!; 
				}); 
			}, 
			), 
		], 
		), 
    ),
	); 
} 
} 
