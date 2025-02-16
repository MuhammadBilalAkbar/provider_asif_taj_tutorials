import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  // double value = 1.0;
  @override
  Widget build(BuildContext context) {
    final exampleOneProvider =
        Provider.of<ExampleOneProvider>(context, listen: true);
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Example One Screen'),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Slider(
      //       // value: value,
      //       value: exampleOneProvider.value,
      //       // onChanged: (val) {
      //       //   value = val;
      //       //   setState(() {});
      //       // },
      //       onChanged: (val) {
      //         debugPrint(exampleOneProvider.value.toString());
      //         exampleOneProvider.onChanged(val);
      //       },
      //     ),
      //     Row(
      //       children: [
      //         Expanded(
      //           child: Container(
      //             height: 100,
      //             color: Colors.green.withValues(alpha: exampleOneProvider.value),
      //             child: Center(
      //               child: Text('Container 1'),
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           child: Container(
      //             height: 100,
      //             color: Colors.red.withValues(alpha: exampleOneProvider.value),
      //             child: Center(
      //               child: Text('Container 2'),
      //             ),
      //           ),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Slider(
                value: value.value,
                onChanged: (val) => value.onChanged(val),
              );
            },
          ),
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.green.withValues(alpha: value.value),
                      child: Center(
                        child: Text('Container 1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withValues(alpha: value.value),
                      child: Center(
                        child: Text('Container 2'),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
