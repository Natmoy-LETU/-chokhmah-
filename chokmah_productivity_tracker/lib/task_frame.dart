import 'package:flutter/material.dart';
import 'task.dart';

class TaskFrame extends StatefulWidget {
  const TaskFrame({Key? key, required Task task}) : super(key: key);

  @override
  _TaskFrameState createState() => _TaskFrameState();
}

class _TaskFrameState extends State<TaskFrame> {
  List<List<Widget>> columns = [
    [
      const SizedBox(height: 20.0),
      Text('Column 1'),
      const SizedBox(height: 20.0),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
             }
            ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Methods',
            
            onPressed: () {
              Navigator.pushNamed(context, '/method');
             }
            )
          ]
        ),     
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add a new column
                setState(() {
                  columns.add(
                    buildColumn(columns.length + 1),
                  );
                });
              },
              child: const Text('Add Column'),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: columns
                  .map((column) => Expanded(
                        child: Column(
                          children: column,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildColumn(int index) {
    return [
      const SizedBox(height: 20.0),
      Text('Column $index'),
      const SizedBox(height: 20.0),
      ElevatedButton(
        onPressed: () {
          // Add a new task
          setState(() {
            columns[index - 1].add(
              const Task(),
            );
          });
        },
        child: const Text('Add Task'),
      ),
      ElevatedButton(
        onPressed: () {
          // Remove the last task
          setState(() {
            columns[index - 1].removeLast();
          });
        },
        child: const Text('Remove Task'),
      ),
    ];
  }
}
