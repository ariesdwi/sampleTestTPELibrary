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
      child: TPEHomePageTL(
        header: TPEHeaderTLComponent(
          userName: 'Aries',
          // onTap: () => debugPrint("Account tapped"),
        ),
        balanceCard: TPEBalanceCard(
          type: TPEBalanceCardType.tl,
          accountNumber: '1234567890',
          currency: 'USD',
          currentBalance: 1234.56,
        ),
        sectionHeader: TpeComponentSectionHeader(
          title: 'Transaction Menu',
          subtitle: 'Manage your finances and account',
          onTap: () => debugPrint("Transaction Menu tapped"),
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
            onTap: () => debugPrint("Account Statemen tapped"),
            subtitle: "Download your Account Statement",
          ),
          TPEHorizontalMenuItem(
            icon: const Icon(Icons.qr_code_scanner),
            title: 'QR Transfer',
            onTap: () => debugPrint("QR tapped"),
            subtitle: "Send money instantly by scanning QR codes",
          ),
        ],
      ),
    ),
    TpeHomepageTWType(
      backgroundImageUrl: 'assets/images/promo.png',
      header: TPEHeaderTw(userName: 'Farischa'),
      balanceCard: TPEBalanceCard(
        type: TPEBalanceCardType.tw,
        accountNumber: '1234567890',
        currency: 'USD',
        currentBalance: 1234.56,
        onSeeAll: () {
          // Handle see all
        },
      ),
      listMenu: [
        TPEHomeMenuItemVertical(
          icon: const Icon(Icons.send),
          title: 'Transfer',
          onTap: () => debugPrint("Transfer tapped"),
        ),

        TPEHomeMenuItemVertical(
          icon: const Icon(Icons.send),
          title: 'Transfer',
          onTap: () => debugPrint("Transfer tapped"),
        ),

        TPEHomeMenuItemVertical(
          icon: const Icon(Icons.send),
          title: 'Transfer',
          onTap: () => debugPrint("Transfer tapped"),
        ),

        TPEHomeMenuItemVertical(
          icon: const Icon(Icons.send),
          title: 'Transfer',
          onTap: () => debugPrint("Transfer tapped"),
        ),
      ],
      sectionHeaderTransaction: TpeComponentSectionHeader(
        title: 'Transaction Menu',
        subtitle: 'Manage your finances and account',
        showLeadingIcon: true,
        onTap: () => debugPrint("Transaction Menu tapped"),
      ),
      listTransaction: [
        const TpeTransactionItemTw(
          isLoading: false,
          activityTitle: 'Transfer to BRI',
          activityText: 'Transfer to BRI',
          activityAmount: 'Rp 1.000.000',
          activityDate: '12 Jan 2023',
          activityIcon:
              'https://hondapekalonganmotor.com/wp-content/uploads/2020/03/71044716-red-easy-vector-illustration-isolated-paper-bubble-banner-promo-this-element-is-well-adapted-for-web.jpg',
          activityStatus: 1,
        ),
        const TpeTransactionItemTw(
          isLoading: false,
          activityTitle: 'Transfer to BRI',
          activityText: 'Transfer to BRI',
          activityAmount: 'Rp 1.000.000',
          activityDate: '12 Jan 2023',
          activityIcon: 'assets/images/TRANSFER_NEW.png',
          activityStatus: 2,
        ),
      ],
      sectionHeaderPromo: TpeComponentSectionHeader(
        title: 'Promo',
        subtitle: 'Latest offers and discounts',
      ),
      promoBannerTw: TpePromoBannerTw(
        imageUrls: [
          'assets/images/placeholder.png',
          'https://hondapekalonganmotor.com/wp-content/uploads/2020/03/71044716-red-easy-vector-illustration-isolated-paper-bubble-banner-promo-this-element-is-well-adapted-for-web.jpg',
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home TW'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home TL'),
        ],
      ),
    );
  }
}
