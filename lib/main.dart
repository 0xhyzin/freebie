import 'package:flutter/material.dart';
import 'package:freebie/features/on_branding/presentation/on_branding.dart';
import 'package:freebie/features/sing_up/presentation/screens/sing_up.dart';

void main() {
  runApp(MaterialApp(home: MainApp(),debugShowCheckedModeBanner: false,));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingUp(), backgroundColor: Colors.white);
  }
}
