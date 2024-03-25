import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Draggable & Expandable Widget'),
        ),
        body: const DraggableExpandableWidget(),
      ),
    );
  }
}

class DraggableExpandableWidget extends StatefulWidget {
  const DraggableExpandableWidget({super.key});

  @override
  _DraggableExpandableWidgetState createState() =>
      _DraggableExpandableWidgetState();
}

class _DraggableExpandableWidgetState extends State<DraggableExpandableWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: 'draggable_widget',
      feedback: Container(
        color: Colors.blue.withOpacity(0.5),
        height: isExpanded ? 200.0 : 100.0,
        width: 200.0,
        child: Center(
          child: isExpanded
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(),
                    Text('Additional Content'),
                    Divider(),
                    Text('Additional Content'),
                    Divider(),
                  ],
                )
              : Container(),
        ),
      ),
      childWhenDragging: Container(),
      child: Container(
        color: Colors.blue,
        height: isExpanded ? 200.0 : 100.0,
        width: 200.0,
        child: Center(
          child: isExpanded
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(),
                    Text('Additional Content'),
                    Divider(),
                    Text('Additional Content'),
                    Divider(),
                  ],
                )
              : IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
        ),
      ),
    );
  }
}
