import 'package:flutter/material.dart';

// Enum to represent different states of the task
enum TaskState {
  expanded,
  collapsed,
}

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

//Dummy task for initial load state
class DummyTask extends Task {
  const DummyTask({super.key});
  // Implement the Task class with default values or behaviors
  // This is just a placeholder and should not be used for actual task data
}



class _TaskState extends State<Task> {
  TaskState taskState = TaskState.collapsed;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            width: constraints.minWidth, // Match the width of the child widget
            height: constraints.minHeight, // Match the height of the child widget
            color: Colors.white, // Match the color of the child widget
          );
        },
      ), 
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("<Task Name>"),
                  const SizedBox(height: 8),
                  Flexible( //wrap children in a box to prevent overflow
                    fit: FlexFit.loose,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Status'),
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
                  ),
                const SizedBox(height: 8),
                Flexible(
                  fit: FlexFit.loose,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: '% Complete'),
                    onChanged: (String? newValue) {},
                    items: const [
                      DropdownMenuItem<String>(
                        value: '% complete',
                        child: Text('% complete'),
                      ),
                      DropdownMenuItem<String>(
                        value: '10%',
                        child: Text('10%'),
                      ),
                      DropdownMenuItem<String>(
                        value: '20%',
                        child: Text('20%'),
                      ),
                      DropdownMenuItem<String>(
                        value: '30%',
                        child: Text('30%'),
                      ),
                      DropdownMenuItem<String>(
                        value: '40%',
                        child: Text('40%'),
                      ),
                      DropdownMenuItem<String>(
                        value: '50%',
                        child: Text('50%'),
                      ),
                      DropdownMenuItem<String>(
                        value: '60%',
                        child: Text('60%'),
                      ),
                      DropdownMenuItem<String>(
                        value: '70%',
                        child: Text('70%'),
                      ),
                      DropdownMenuItem<String>(
                        value: '80%',
                        child: Text('80%'),
                      ),
                      DropdownMenuItem<String>(
                        value: '90%',
                        child: Text('90%'),
                      ),
                      DropdownMenuItem<String>(
                        value: '100%',
                        child: Text('100%'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                IconButton(
                  icon: Icon(
                    taskState == TaskState.expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  ),
                  onPressed: () {
                    setState(() {
                      taskState = taskState == TaskState.collapsed ? TaskState.expanded : TaskState.collapsed;
                    });
                  },
                ),
              ],
              ),
              if (taskState == TaskState.expanded) ...[
                const SizedBox(height: 8),
                Flexible(
                  fit: FlexFit.loose,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Dependencies'),
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
                ),
                const SizedBox(height: 8),
                Flexible(
                  fit: FlexFit.loose,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Resources'),
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
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Estimated Time'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Action to perform when "View Subtasks" button is clicked
                  },
                  child: const Text('View Subtasks'),
                ),
                const SizedBox(height: 8),
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
    );
  }
}
