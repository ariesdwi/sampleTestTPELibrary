import 'package:flutter/material.dart';
import 'package:hello_ios/screens/splashscreen.dart';
import 'screens/component_catalog_screen.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TPE Library',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
