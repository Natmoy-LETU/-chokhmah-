import 'package:flutter/material.dart';
import 'task.dart';

class TaskFrame extends StatelessWidget {
  const TaskFrame({Key? key, required Task task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0), // Adding padding
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigate to the Task screen
              Navigator.pushNamed(context, '/task');
            },
            child: const Text('Create Task'), // Button to create a task instance
          ),
      
          Row(
            children: [
              // Container for Drag Targets with Vertical Dividers
              Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    DragTarget<String>(
                      builder: (BuildContext context, List<String?> candidateData,
                          List<dynamic> rejectedData) {
                        return Container(
                          height: 200.0,
                          width: 200.0,
                          alignment: Alignment.center,
                          color: candidateData.isEmpty
                              ? Colors.grey[300]
                              : Colors.greenAccent,
                          child: const Text('Drop here'),
                        );
                      },
                      onAccept: (String data) {
                        // Handle the dropped data
                      },
                    ),
                    Divider(
                      thickness: 1.0,
                      height: 20.0,
                    ),
                    DragTarget<String>(
                      builder: (BuildContext context, List<String?> candidateData,
                          List<dynamic> rejectedData) {
                        return Container(
                          height: 200.0,
                          width: 200.0,
                          alignment: Alignment.center,
                          color: candidateData.isEmpty
                              ? Colors.grey[300]
                              : Colors.greenAccent,
                          child: const Text('Drop here'),
                        );
                      },
                      onAccept: (String data) {
                        // Handle the dropped data
                      },
                    ),
                  ],
                ),
              ), 
            ],
          ),
        ]
      )
    );
  }
}
