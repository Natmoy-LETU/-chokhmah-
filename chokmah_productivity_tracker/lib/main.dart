import 'package:chokmah_productivity_tracker/method_changer.dart';
import 'package:flutter/material.dart';

// Import necessary program files
import 'package:chokmah_productivity_tracker/settings_frame.dart';
import 'package:chokmah_productivity_tracker/task.dart';
import 'package:chokmah_productivity_tracker/task_frame.dart';

void main() {
  runApp(Chokmah());
}

class Chokmah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chokmah Productivity Tracker',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      // Define routes for each screen
      initialRoute: '/',
      routes: {
        '/': (context) => const MainMenu(title: 'Start Page'),
        '/settings': (context) => const Settings(title: '',),
        '/task_frame': (context) => const TaskFrame(task:DummyTask()),
        '/task': (context) => const Task(),
        '/method':(context) => MethodMenu(title: 'Methods'),

      },
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context, 
                  '/task_frame',
                  );
              },
              child: const Text('Go to TaskFrame Screen'),
            ),
            
          ],
        ),
      ),
    );
  }
}
