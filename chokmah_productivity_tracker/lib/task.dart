import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<String>(
      data: 'draggable_widget',
      feedback: Material(
        elevation: 4.0,
        child: Container(
          color: Colors.blue.withOpacity(0.5),
          height: isExpanded ? 200.0 : 100.0,
          width: double.infinity,
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
      child: DragTarget<String>(
        builder: (context, candidateData, rejectedData) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Material(
                elevation: 4.0,
                child: SizedBox(
                  width: constraints.maxWidth,
                  height: isExpanded ? constraints.maxWidth : constraints.maxWidth / 2, // Maintain aspect ratio
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                          ),
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
              );
            },
          );
        },
        onWillAccept: (data) {
          // Implement your onWillAccept logic
          return true;
        },
        onLeave: (data) {
          // Implement your onLeave logic
        },
        onAccept: (data) {
          // Implement your onAccept logic
        },
      ),
    );
  }
}
