import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_asif_taj_tutorials/screens/with_provider/notify_listeners_screen.dart';
import '/screens/with_provider/dark_and_light_theme.dart';

import '/provider/counter_provider.dart';
import '/provider/example_one_provider.dart';
import '/provider/favorite_provider.dart';
import '/provider/theme_provider.dart';

import '/screens/without_provider/stateless_widget_screen.dart';
import 'screens/without_provider/stateful_widget_screen.dart';
import '/screens/without_provider/why_provider_screen.dart';
import '/screens/with_provider/counter_example.dart';
import '/screens/with_provider/example_one_screen.dart';
import '/screens/with_provider/favorite/favorite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //   /// Without Provider
    //   return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     // home: StatelessWidgetScreen(),
    //     // home: const StatefulWidgetScreen(),
    //   // home: const WhyProviderScreen(),
    //   );

    /// With Provider
    /// 1. Single Provider
    // return ChangeNotifierProvider(
    //   create: (context) => CounterProvider(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home: const CounterExample(),
    //   ),
    // );

    /// 2. Multi Provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          debugPrint('build MaterialApp');
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Provider State Management',
            themeMode: value.currentThemeMode,

            /// Light Theme
            // theme: ThemeData.light().copyWith(),
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.red,

              /// It is light by default.
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                centerTitle: true,
              ),
            ),

            /// Dark Theme
            // darkTheme: ThemeData.dark().copyWith(),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.purple,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.teal,
                centerTitle: true,
              ),
              iconTheme: IconThemeData(color: Colors.red),
            ),
            // home: const ExampleOneScreen(),
            // home: const FavoriteScreen(),
            // home: const DarkAndLightTheme(),
            home: NotifyListenersScreen(),
          );
        },
      ),
    );
  }
}
