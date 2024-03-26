import 'package:flutter/material.dart';

// Enum to represent different states of the task
enum TaskState {
  Expanded,
  Collapsed,
}

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  TaskState taskState = TaskState.Collapsed;
  List<Widget> taskWidgets = [
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: 'draggable_widget',
      childWhenDragging: Container(),
      feedback: Material(
        elevation: 4.0,
        child: Container(
          color: Colors.blue.withOpacity(0.5),
          height: taskState == TaskState.Expanded ? 200.0 : 100.0,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: taskWidgets,
            ),
          ),
        ),
      ),
      child: DragTarget<String>(
        builder: (context, candidateData, rejectedData) {
          return Material(
            elevation: 4.0,
            child: InkWell(
              onTap: () {
                setState(() {
                  taskState = taskState == TaskState.Collapsed ? TaskState.Expanded : TaskState.Collapsed;
                });
              },
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      taskState == TaskState.Expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    ),
                    onPressed: () {
                      setState(() {
                        taskState = taskState == TaskState.Collapsed ? TaskState.Expanded : TaskState.Collapsed;
                      });
                    },
                  ),
                ),
              ),
            ),
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
