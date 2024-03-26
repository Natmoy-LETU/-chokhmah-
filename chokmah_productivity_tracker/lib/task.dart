import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({super.key});

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
  // ignore: library_private_types_in_public_api
  _DraggableExpandableWidgetState createState() =>
      _DraggableExpandableWidgetState();
}

class _DraggableExpandableWidgetState extends State<DraggableExpandableWidget> {
  bool isExpanded = false;
  bool isDragOverTarget1 = false;
  bool isDragOverTarget2 = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Drag targets
        Positioned(
          top: 100,
          left: 50,
          child: DragTarget<String>(
            onWillAccept: (data) {
              setState(() {
                isDragOverTarget1 = true;
              });
              return true;
            },
            onLeave: (data) {
              setState(() {
                isDragOverTarget1 = false;
              });
            },
            onAccept: (data) {
              setState(() {
                isDragOverTarget1 = false;
                // Handle when an item is dropped onto this target
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200,
                height: 100,
                color: isDragOverTarget1 ? Colors.green : Colors.transparent,
              );
            },
          ),
        ),
        Positioned(
          top: 300,
          left: 50,
          child: DragTarget<String>(
            onWillAccept: (data) {
              setState(() {
                isDragOverTarget2 = true;
              });
              return true;
            },
            onLeave: (data) {
              setState(() {
                isDragOverTarget2 = false;
              });
            },
            onAcceptWithDetails: (data) {
              setState(() {
                isDragOverTarget2 = false;
                // Handle when an item is dropped onto this target
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200,
                height: 100,
                color: isDragOverTarget2 ? Colors.green : Colors.transparent,
              );
            },
          ),
        ),
        // Draggable item
    Draggable<String>(
      data: 'draggable_widget',
      feedback: Material(
        elevation: 4.0,
        child: Container(
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
      ),
      childWhenDragging: Container(),
      child: Material(
        elevation: 4.0,
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
        ),
      )
      ]
      );
  }
}
