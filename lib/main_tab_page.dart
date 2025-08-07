import 'package:flutter/material.dart';
import 'package:hello_ios/screens/login_template.dart';
import 'screens/component_catalog_screen.dart';
import 'screens/homepage_template.dart';
import 'screens/login_template.dart';
import 'screens/account_template.dart';
// import 'widgets/coming_soon_wrapper.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  int _selectedIndex = 0;

  final bool isHomeFeatureComingSoon = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  late final List<Widget> _pages = [
    ComponentCatalogScreen(),
    HompageTemplate(),
    LoginTemplate(),
    // AccountTemplate(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.widgets), label: 'Components'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Homepage'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
