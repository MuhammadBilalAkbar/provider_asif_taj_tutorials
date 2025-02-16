import 'package:flutter/material.dart';

class StatefulWidgetScreen extends StatefulWidget {
  const StatefulWidgetScreen({super.key});

  @override
  State<StatefulWidgetScreen> createState() => _StatefulWidgetScreenState();
}

class _StatefulWidgetScreenState extends State<StatefulWidgetScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Widget Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(DateTime.now().toString()),
          Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 50),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          debugPrint('$count');
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
