import 'package:flutter/material.dart';
import 'package:freebie/core%20copy/config/theme_data/theme_data_light.dart';
import 'package:freebie/core/config/theme_data/theme_data_dark.dart';
import 'package:freebie/features/on_branding/presentation/on_branding.dart';
import 'package:freebie/features/sing_up/presentation/screens/sing_up.dart';

void main() {
  runApp(
    MaterialApp(
      home: MainApp(),
      debugShowCheckedModeBanner: false,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.light,
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingUp(), backgroundColor: Colors.white);
  }
}
