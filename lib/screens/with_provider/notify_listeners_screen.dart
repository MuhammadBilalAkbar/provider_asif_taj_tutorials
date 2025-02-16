/*
Use stateless widgets as a stateful widget

Yes, you can avoid using ChangeNotifierProvider or MultiProvider
by using ValueNotifier<T> directly. ValueNotifier is a lightweight
alternative to ChangeNotifier and can be used for simpler state management needs.

Yes, you can build a complete app without StatefulWidget by using
stateless widgets and managing state externally.
ou can achieve this with:
1. ValueNotifier<T>: For simple state management.
2. ChangeNotifierProvider or MultiProvider: For more complex state management.

ValueNotifier is a lightweight alternative to ChangeNotifier
and can be used for simpler state management needs.
Yes, you can use ValueNotifier<T> for state management in your app.
However, it is more suitable for small to medium-sized apps or for
managing localized state.

ValueNotifier Cons:
❌ Cons of ValueNotifier<T>: ❌ Not scalable (managing multiple values is hard).
❌ Cannot handle complex state (like lists, API calls).
❌ Difficult to use in large apps (no dependency injection).
*/
import 'package:flutter/material.dart';

class NotifyListenersScreen extends StatelessWidget {
  NotifyListenersScreen({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(title: const Text('Subscribe')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: toggle,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: toggle.value,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffix: InkWell(
                    onTap: () {
                      toggle.value = !toggle.value;
                    },
                    child: Icon(
                      toggle.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                    ),
                  ),
                ),
              );
            },
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          debugPrint(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
