import 'package:flutter/material.dart';
import 'task.dart';

class TaskFrame extends StatefulWidget {
  const TaskFrame({Key? key}) : super(key: key);

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
        title: const Text('Task Frame'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
            ElevatedButton(onPressed: (){
              //remove last column
              setState(() {
                if(columns.isNotEmpty){
                    columns.removeLast();
                  }
              });
            },
              child: const Text('Remove Column')
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
            ], //end of children
          ),
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
            columns[index-1].add(
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
              if(columns[index - 1].length > 5){
                columns[index - 1].removeLast();
              }
          });
        },
        child: const Text('Remove Task'),
      ),
    ];
  }
}
