
import 'package:flutter/material.dart';
import 'screens/component_catalog_screen.dart';
import 'package:tpe_homepage_sdk/tpe_homepage_sdk.dart';
import 'widgets/coming_soon_wrapper.dart'; // Import the wrapper

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  int _selectedIndex = 0;

  final bool isHomeFeatureComingSoon = false; // ← toggle this

  late final List<Widget> _pages = [
    const ComponentCatalogScreen(),
    ComingSoonWrapper(
      isComingSoon: isHomeFeatureComingSoon,
      child: HomePageTL(
        onTransferTap: () => debugPrint("Transfer"),
        onAccountTap: () => debugPrint("Account"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Components',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
