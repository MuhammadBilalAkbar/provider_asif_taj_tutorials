import 'package:flutter/material.dart';

class StatelessWidgetScreen extends StatelessWidget {
  StatelessWidgetScreen({super.key});

  int x = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '$x',
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x++;
          debugPrint('$x');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
