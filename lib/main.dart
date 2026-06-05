import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme_data/theme_data_dark.dart';
import 'package:freebie/core/config/theme_data/theme_data_light.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.light,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("DemoScreen")),
            ElevatedButton(onPressed: null, child: Text("DemoScreen")),
            Text("data")
          ],
        ),
      ),
    );
  }
}
