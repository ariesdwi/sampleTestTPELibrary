import 'package:flutter/material.dart';
import 'package:hello_ios/widgets/organizm/tpe_organism_biometric.dart';
import 'package:hello_ios/widgets/organizm/tpe_organism_language.dart';
import 'package:hello_ios/widgets/organizm/tpe_organism_language_with_button.dart';
import 'package:hello_ios/widgets/organizm/tpe_organism_primary_secondary_bs.dart';
import 'package:hello_ios/widgets/organizm/tpe_organism_single_button_bs.dart';
import 'package:hello_ios/widgets/template/tpe_login_page.dart';
import 'package:hello_ios/widgets/template/tpe_login_page_tw.dart';
import 'package:hello_ios/widgets/template/tpe_register_page.dart';
import 'package:tpe_component_sdk/components/button/tpe_navigation_card.dart';
import '../models/catalog_item.dart';
import '../models/catalog_section.dart';

import 'package:tpe_homepage_sdk/tpe_homepage_sdk.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';
import '../widgets/organizm/tpe_organism_form_login.dart';
// import '../widgets/organizm/tpe_organism_biometric.dart';
// import 'package:hello_ios/widgets/organizm/tpe_organism_language.dart';
// import 'package:hello_ios/widgets/organizm/tpe_organism_primary_secondary_bs.dart';
// import 'package:hello_ios/widgets/organizm/tpe_organism_single_button_bs.dart';
// import '../widgets/template/tpe_login_page.dart';

class HompageTemplate extends StatelessWidget {
  const HompageTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = _buildSections(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Template")),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return ExpansionTile(
            title: Text(
              section.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: section.items.map((item) {
              return ListTile(
                leading: Icon(item.icon, color: Colors.blue),
                title: Text(item.label),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  if (item.destination != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => item.destination!),
                    );
                  }
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  List<CatalogSection> _buildSections(BuildContext context) {
    return [
      CatalogSection(
        title: "Template Homepage",
        items: [
          CatalogItem(
            label: "Homepage Timor Leste",
            icon: Icons.label_important,
            destination: TPEHomePageTL(
              refreshCallback: () async {},
              header: TPEHeaderComponent(
                userName: 'Aries',
                singleLineType: true,
                rightCircleButton: TPECircleIconButton(
                  icon: Icons.logout,
                  size: 36,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return TpeModalConfirmation(
                            "You will need to enter your username and password to log in again",
                            "Logout ?",
                            textButtonNo: "Cancel",
                            textButtonYa: "Logout",
                            () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HompageTemplate(),
                                ),
                                (route) => false,
                              );
                            },
                            () {
                              Navigator.pop(context);
                            },
                          );
                        });
                  },
                ),
              ),
              balanceCard: const TPEBalanceCardTL(
                accountNumber: '1234567890',
                currency: 'USD',
                currentBalance: 1234.56,
                isLoading: false,
              ),
              menuSection: TPEMenuHorizontalSection(
                sectionHeader: const TpeComponentSectionHeader(
                  title: 'Transaction Menu',
                  subtitle: 'Manage your finance and account',
                ),
                menuItems: [
                  TPEHorizontalMenuItem(
                    icon: const Icon(Icons.send),
                    title: 'Transfer',
                    subtitle:
                        "Transfer money securely to any domestic bank account",
                    onTap: () => _showSnackbar(context, "Transfer tapped"),
                  ),
                  TPEHorizontalMenuItem(
                    icon: const Icon(Icons.account_balance),
                    title: 'Account',
                    subtitle: "Check your account details and balance",
                    onTap: () => _showSnackbar(context, "Account tapped"),
                  ),
                  TPEHorizontalMenuItem(
                    icon: const Icon(Icons.account_balance_wallet),
                    title: 'Account Statement',
                    subtitle: "Download your Account Statement",
                    onTap: () =>
                        _showSnackbar(context, "Account Statement tapped"),
                  ),
                  TPEHorizontalMenuItem(
                    icon: const Icon(Icons.qr_code_scanner),
                    title: 'QR Transfer',
                    subtitle: "Send money instantly by scanning QR codes",
                    onTap: () => _showSnackbar(context, "QR tapped"),
                  ),
                ],
              ),
            ),
          ),
          CatalogItem(
            label: "Homepage Taipei",
            icon: Icons.label_important,
            destination: TpeHomepageTWType(
              onRefreshTap: () async {
                _showSnackbar(context, "Refresh homepage");
              },
              header: TPEHeaderComponent(
                userName: 'Farischa',
                singleLineType: false,
                rightCircleButton: TPECircleIconButton(
                    icon: Icons.notifications,
                    size: 36,
                    badgeCount: 99,
                    badgeSize: 12,
                    onPressed: () => Navigator.pop(context)),
              ),
              balanceCard: TPEBalanceCardTW(
                accountNumber: '1234567890',
                currency: 'USD',
                currentBalance: 1234.56,
                copyColor: TPEColors.white,
                toggleColor: TPEColors.white,
                textBalanceLabelColor: TPEColors.white,
                balanceIndicatorColor: TPEColors.white,
                accountNumberTextColor: TPEColors.white,
                currencyTextColor: TPEColors.white,
                currentBalanceTextColor: TPEColors.white,
                backgroundColor: TPEColors.blue90,
                onSeeAll: TPENavigationCardButton(
                    text: "Lihat semua rekeningmu",
                    textColor: TPEColors.white,
                    backgroundColor: TPEColors.blue90.withOpacity(0.8),
                    iconColor: TPEColors.white,
                    onTap: () {
                      _showSnackbar(context, "See all account tapped");
                    }),
              ),
              listMenu: TPEMenuListVertical(
                menuItems: [
                  TPEHomeMenuItemVertical(
                    iconUrl: 'tes.image',
                    title: 'Transfer',
                    onTap: () => _showSnackbar(context, "Transfer tapped"),
                  ),
                  TPEHomeMenuItemVertical(
                    iconUrl: 'tes.image',
                    title: 'Account',
                    onTap: () => _showSnackbar(context, "Account tapped"),
                  ),
                  TPEHomeMenuItemVertical(
                    iconUrl: 'tes.image',
                    title: 'Account Statement',
                    onTap: () => _showSnackbar(context, "Account Statement"),
                  ),
                  TPEHomeMenuItemVertical(
                    iconUrl: 'tes.image',
                    title: 'QR Transfer',
                    onTap: () => _showSnackbar(context, "QR Transfer tapped"),
                  )
                ],
              ),
              transactionSection: TpeTransactionSection(
                sectionHeader: TpeComponentSectionHeader(
                  title: 'Aktivitas Terbaru',
                  subtitle: 'Pantau aktivitas terbarumu di sini',
                  trailingIcon: const Icon(Icons.chevron_right),
                  onTap: () =>
                      _showSnackbar(context, "finances and account tapped"),
                ),
                listTransaction: [
                  const TpeTransactionItemTw(
                    isLoading: false,
                    activityTitle: 'Penerimaan Negara',
                    activityText: 'KUA Sukajadi - 7625563555167',
                    activityAmount: 'Rp550.000',
                    activityDate: '14 Des 2024  ·  09:30 WIB',
                    activityIcon: 'assets/images/TRANSFER_NEW.png',
                    activityStatus: 1,
                  ),
                  const TpeTransactionItemTw(
                    isLoading: false,
                    activityTitle: 'Penerimaan Negara',
                    activityText: 'Pembuatan Paspor- 7625563555167',
                    activityAmount: 'Rp5.050.000',
                    activityDate: '14 Des 2024  ·  09:30 WIB',
                    activityIcon: 'assets/images/TRANSFER_NEW.png',
                    activityStatus: 2,
                  ),
                  const TpeTransactionItemTw(
                    isLoading: false,
                    activityTitle: 'Transfer Internasional',
                    activityText: 'Bank BCA - 14927553223',
                    activityAmount: 'Rp1.550.000',
                    activityDate: '12 Des 2024  ·  09:30 WIB',
                    activityIcon: 'assets/images/TRANSFER_NEW.png',
                    activityStatus: 1,
                  ),
                ],
              ),
              promoSection: TpePromoSection(
                sectionHeaderPromo: TpeComponentSectionHeader(
                  title: 'Promo & Cashback',
                  subtitle: 'Penawaran khusus buat kamu',
                  trailingIcon: const Icon(Icons.chevron_right),
                  onTap: () =>
                      _showSnackbar(context, "promo and cashback tapped"),
                ),
                promoBannerTw: TpePromoListBannerTw(
                  imageUrls: [
                    'assets/images/placeholder.png',
                    'https://hondapekalonganmotor.com/wp-content/uploads/2020/03/71044716-red-easy-vector-illustration-isolated-paper-bubble-banner-promo-this-element-is-well-adapted-for-web.jpg',
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      CatalogSection(
        title: "Template Login",
        items: [
          CatalogItem(
              label: "TPELoginBottomSheet",
              icon: Icons.horizontal_split,
              destination: TPELoginBottomSheetPage()),
          CatalogItem(
              label: "TPEBiometricBottomSheet",
              icon: Icons.horizontal_split,
              destination: TPEBiometricBottomSheetPage()),
          CatalogItem(
              label: "TPE Login TL",
              icon: Icons.horizontal_split,
              destination: TpeLoginPage()),
          CatalogItem(
              label: "TPE Login TW",
              icon: Icons.horizontal_split,
              destination: TpeLoginPageTW()),
          CatalogItem(
              label: "TPELanguageBottomSheet",
              icon: Icons.menu,
              destination: const TpeOrganismLanguage()),
          CatalogItem(
              label: "TPELanguageBottomSheetWithButton",
              icon: Icons.menu,
              destination: const TpeOrganismLanguageWithButton()),
          CatalogItem(
              label: "TPEPrimarySecondaryBottomSheet",
              icon: Icons.menu,
              destination: const TpeOrganismPrimarySecondaryBs()),
          CatalogItem(
              label: "TPESingleButtonBottomSheet",
              icon: Icons.menu,
              destination: const TpeOrganismSingleButtonBottomSheet()),
          CatalogItem(
              label: "TPERegisterPage",
              icon: Icons.menu,
              destination: const TpeRegisterPage()),
        ],
      ),
    ];
  }
}
