import 'dart:async';

import 'package:flutter/material.dart';

class WhyProviderScreen extends StatefulWidget {
  const WhyProviderScreen({super.key});

  @override
  State<WhyProviderScreen> createState() => _WhyProviderScreenState();
}

class _WhyProviderScreenState extends State<WhyProviderScreen> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      // debugPrint('$count');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build $count');
    return Scaffold(
      appBar: AppBar(
        title: Text('Why Provider Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }
}
