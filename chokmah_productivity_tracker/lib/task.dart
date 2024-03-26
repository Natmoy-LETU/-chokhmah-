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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // Constrain the width of the task
      child: Draggable<String>(
        data: 'draggable_widget',
        childWhenDragging: Container(),
        feedback: Material(
          elevation: 4.0,
          child: Container(
            color: Colors.blue.withOpacity(0.5),
            height: taskState == TaskState.Expanded ? 200.0 : 100.0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Always visible
                  Text("<Task name>"),
                  DropdownButton<String>(
                    value: '% complete',
                    onChanged: (String? newValue) {},
                    items: [
                      for (int i = 0; i <= 100; i += 10)
                        DropdownMenuItem<String>(
                          value: '$i%',
                          child: Text('$i%'),
                        ),
                    ],
                  ),
                  // Visible when expanded
                  if (taskState == TaskState.Expanded) ...[
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Dependencies'),
                      onChanged: (String? newValue) {},
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'dependencies1',
                          child: Text('<Dependencies 1>'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'dependencies2',
                          child: Text('<Dependencies 2>'),
                        ),
                        // Add more unique values here
                      ],
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Resources'),
                      onChanged: (String? newValue) {},
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'resources1',
                          child: Text('<Resources 1>'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'resources2',
                          child: Text('<Resources 2>'),
                        ),
                        // Add more unique values here
                      ],
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Status'),
                      onChanged: (String? newValue) {},
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'status1',
                          child: Text('<Status 1>'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'status2',
                          child: Text('<Status 2>'),
                        ),
                        // Add more unique values here
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Estimated Time'),
                      keyboardType: TextInputType.number,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Action to perform when "View Subtasks" button is clicked
                      },
                      child: const Text('View Subtasks'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Action to perform when "Task Settings" button is clicked
                      },
                      child: const Text('Task Settings'),
                    ),
                  ],
                ],
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
      ),
    );
  }
}
