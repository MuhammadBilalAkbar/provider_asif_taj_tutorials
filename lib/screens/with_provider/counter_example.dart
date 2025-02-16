import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/counter_provider.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  
  @override
  void initState() {
    super.initState();
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      counterProvider.increment();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Count Example'),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, value, child) {
            debugPrint('build text');
            return Text(
              // counterProvider.count.toString(),
              value.count.toString(),
              style: TextStyle(fontSize: 50),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
