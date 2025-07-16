import 'package:flutter/material.dart';
import 'screens/component_catalog_screen.dart';
import 'package:tpe_homepage_sdk/tpe_homepage_sdk.dart';
import 'widgets/coming_soon_wrapper.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  int _selectedIndex = 0;

  final bool isHomeFeatureComingSoon = false;

  late final List<Widget> _pages = [
    const ComponentCatalogScreen(),
    ComingSoonWrapper(
      isComingSoon: isHomeFeatureComingSoon,
      child: HomePageTL(
        header: TPEHeaderTLComponent(
          userName: 'Aries',
          onTap: () => debugPrint("Account tapped"),
        ),
        balanceCard: const TPEBalanceCardTLType(
          accountNumber: '0452 0200 0002 805',
          currentBalance: 1000000,
          currency: 'IDR',
        ),
        sectionHeader: const TpeComponentSectionHeader(
          title: 'Transaction Menu',
          subtitle: 'Manage your finances and account',
        ),
        menuItems: [
          TPEHorizontalMenuItem(
            icon: const Icon(Icons.send),
            title: 'Transfer',
            onTap: () => debugPrint("Transfer tapped"),
            subtitle: "Transfer money securely to any domestic bank account",
          ),
          TPEHorizontalMenuItem(
            icon: const Icon(Icons.account_balance),
            title: 'Account',
            onTap: () => debugPrint("Account tapped"),
            subtitle: "Check your account details and balance",
          ),
          TPEHorizontalMenuItem(
            icon: const Icon(Icons.account_balance_wallet),
            title: 'Account Statement',
            onTap: () => debugPrint("History tapped"),
            subtitle: "Download your Account Statement",
          ),
          TPEHorizontalMenuItem(
            icon: const Icon(Icons.qr_code_scanner),
            title: 'QR Transfer',
            onTap: () => debugPrint("History tapped"),
            subtitle: "Send money instantly by scanning QR codes",
          ),
        ],
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        ],
      ),
    );
  }
}
