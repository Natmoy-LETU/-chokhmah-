import 'package:flutter/material.dart';

// Enum to represent different states of the widget
enum WidgetState {
  Expanded,
  Collapsed,
}

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  WidgetState widgetState = WidgetState.Collapsed;
  List<Widget> collapsedWidgets = [
    Placeholder(),
    Placeholder(),
  ];
  List<Widget> expandedWidgets = [
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> currentWidgets =
        widgetState == WidgetState.Collapsed ? collapsedWidgets : expandedWidgets;

    return LongPressDraggable<String>(
      data: 'draggable_widget',
      feedback: Material(
        elevation: 4.0,
        child: Container(
          color: Colors.blue.withOpacity(0.5),
          height: widgetState == WidgetState.Expanded ? 200.0 : 100.0,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: currentWidgets,
            ),
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
                  height: widgetState == WidgetState.Expanded
                      ? constraints.maxWidth
                      : constraints.maxWidth / 2, // Maintain aspect ratio
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widgetState =
                            widgetState == WidgetState.Collapsed ? WidgetState.Expanded : WidgetState.Collapsed;
                      });
                    },
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            widgetState == WidgetState.Expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                          ),
                          onPressed: () {
                            setState(() {
                              widgetState =
                                  widgetState == WidgetState.Collapsed ? WidgetState.Expanded : WidgetState.Collapsed;
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
