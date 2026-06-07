import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme_data/theme_data_dark.dart';
import 'package:freebie/core/config/theme_data/theme_data_light.dart';
import 'package:freebie/features/on_branding/presentation/on_branding.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBranding(),
      debugShowCheckedModeBanner: false,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.light,
    );
  }
}
