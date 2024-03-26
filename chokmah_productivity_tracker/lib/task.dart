import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({Key? key}) : super(key: key);

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
  const DraggableExpandableWidget({Key? key}) : super(key: key);

  @override
  _DraggableExpandableWidgetState createState() => _DraggableExpandableWidgetState();
}

class _DraggableExpandableWidgetState extends State<DraggableExpandableWidget> {
  bool isExpanded = false;
  List<bool> isDragOverTargets = List.generate(2, (_) => false); // Initialize with 2 drag targets

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
                isDragOverTargets[0] = true;
              });
              return true;
            },
            onLeave: (data) {
              setState(() {
                isDragOverTargets[0] = false;
              });
            },
            onAccept: (data) {
              setState(() {
                isDragOverTargets[0] = false;
                // Handle when an item is dropped onto this target
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200,
                height: 100,
                color: isDragOverTargets[0] ? Colors.green : Colors.transparent,
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
                isDragOverTargets[1] = true;
              });
              return true;
            },
            onLeave: (data) {
              setState(() {
                isDragOverTargets[1] = false;
              });
            },
            onAcceptWithDetails: (data) {
              setState(() {
                isDragOverTargets[1] = false;
                // Handle when an item is dropped onto this target
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200,
                height: 100,
                color: isDragOverTargets[1] ? Colors.green : Colors.transparent,
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
        ),
      ],
    );
  }
}