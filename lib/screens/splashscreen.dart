import 'package:flutter/material.dart';
import '../main_tab_page.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainTabPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TPEColors.blue70,
      body: Center(
        child: Image.asset(
          'assets/images/LogoBRImoTimles.png',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
