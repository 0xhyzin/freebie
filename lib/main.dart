import 'package:flutter/material.dart';
import 'package:freebie/features/on_branding/presentation/on_branding.dart';

void main() {
  runApp(MaterialApp(home: MainApp(),debugShowCheckedModeBanner: false,));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OnBranding(), backgroundColor: Colors.white);
  }
}
