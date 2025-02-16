/// Without Consumer
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../provider/theme_provider.dart';
//
// class DarkAndLightTheme extends StatefulWidget {
//   const DarkAndLightTheme({super.key});
//
//   @override
//   State<DarkAndLightTheme> createState() => _DarkAndLightThemeState();
// }
//
// class _DarkAndLightThemeState extends State<DarkAndLightTheme> {
//   @override
//   Widget build(BuildContext context) {
//     // final themeProvider = Provider.of<ThemeProvider>(context, listen: false); // Does not update the UI.
//     final themeProvider = Provider.of<ThemeProvider>(context); // listen is by default true, it updates the UI.
//     debugPrint('build');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dark and Light Theme'),
//       ),
//       body: Column(
//         children: [
//           RadioListTile(
//             title: Text('Light Mode'),
//             value: ThemeMode.light,
//             groupValue: themeProvider.currentThemeMode,
//             onChanged: themeProvider.setTheme,
//           ),
//           RadioListTile(
//             title: Text('Dark Mode'),
//             value: ThemeMode.dark,
//             groupValue: themeProvider.currentThemeMode,
//             onChanged: themeProvider.setTheme,
//           ),
//           RadioListTile(
//             title: Text('System Mode'),
//             value: ThemeMode.system,
//             groupValue: themeProvider.currentThemeMode,
//             onChanged: themeProvider.setTheme,
//           ),
//         ],
//       ),
//     );
//   }
// }

/// With Consumer
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';

class DarkAndLightTheme extends StatefulWidget {
  const DarkAndLightTheme({super.key});

  @override
  State<DarkAndLightTheme> createState() => _DarkAndLightThemeState();
}

class _DarkAndLightThemeState extends State<DarkAndLightTheme> {
  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(title: Text('Dark and Light Theme')),
      body: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              RadioListTile(
                title: Text('Light Mode'),
                value: ThemeMode.light,
                groupValue: value.currentThemeMode,
                onChanged: value.setTheme,
              ),
              RadioListTile(
                title: Text('Dark Mode'),
                value: ThemeMode.dark,
                groupValue: value.currentThemeMode,
                onChanged: value.setTheme,
              ),
              RadioListTile(
                title: Text('System Mode'),
                value: ThemeMode.system,
                groupValue: value.currentThemeMode,
                onChanged: value.setTheme,
              ),
              Icon(Icons.favorite),
            ],
          );
        },
      ),
    );
  }
}

/// When to Use: Use listen: true => when the widget depends on the provider's state and needs to rebuild when that state changes. This is suitable for UI components that directly reflect the state of the provider.
/// When to Use: Use listen: false => when you need to access the provider's instance or call methods on the provider but do not need the widget to rebuild on state changes. This is useful for actions such as triggering events or retrieving initial data without causing unnecessary rebuilds.
