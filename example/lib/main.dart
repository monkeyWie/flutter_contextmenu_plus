import 'package:contextmenu/contextmenu_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Context Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ContextMenuArea(
          builder: (context) => [
            ListTile(
              title: Text('Option 1'),
              onTap: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Whatever'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.model_training),
              title: Text('Option 2'),
              onTap: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Foo!'),
                  ),
                );
              },
            )
          ],
          child: Card(
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                'Press somewhere for context menu.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}