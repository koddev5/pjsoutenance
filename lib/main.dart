import 'package:flutter/material.dart';
import 'package:pjenerteam/screens/welcom_screen.dart';
import 'package:pjenerteam/theme/theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enerteam',
      theme: lightMode,
      home: const WelcomeScreen(),
    );
  }
}
