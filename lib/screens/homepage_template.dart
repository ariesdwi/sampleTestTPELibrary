import 'package:flutter/material.dart';
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
              header: TPEHeaderComponent(
                userName: 'Aries',
                singleLineType: true,
                rightCircleButton: TPECircleIconButton(
                  icon: Icons.logout,
                  onPressed: () => Navigator.pop(context),
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
              backgroundImageUrl: 'assets/images/promo.png',
              header: TPEHeaderComponent(
                userName: 'Farischa',
                singleLineType: false,
                rightCircleButton: TPECircleIconButton(
                    icon: Icons.logout,
                    onPressed: () => Navigator.pop(context)),
              ),
              balanceCard: TPEBalanceCardTW(
                accountNumber: '1234567890',
                currency: 'USD',
                currentBalance: 1234.56,
              ),
              listMenu: TPEMenuListVertical(
                menuItems: [
                  TPEHomeMenuItemVertical(
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
                    title: 'Transfer',
                    onTap: () => _showSnackbar(context, "Transfer tapped"),
                  ),
                  TPEHomeMenuItemVertical(
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
                    iconSize: 20,
                    title: 'Account',
                    onTap: () => _showSnackbar(context, "Account tapped"),
                  ),
                  TPEHomeMenuItemVertical(
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
                    iconSize: 20,
                    title: 'Account Statement',
                    onTap: () => _showSnackbar(context, "Account Statement"),
                  ),
                  TPEHomeMenuItemVertical(
                    iconUrl: 'tes.image',
                    iconSize: 20,
                    title: 'QR Transfer',
                    onTap: () => _showSnackbar(context, "QR Transfer tapped"),
                  ),
                ],
              ),
              transactionSection: TpeTransactionSection(
                sectionHeader: TpeComponentSectionHeader(
                  leadingIcon: TPEBaseIconUrl(
                      iconUrl:
                          'https://cdn-icons-png.flaticon.com/512/4256/4256863.png'),
                  title: 'Transaction Menu',
                  subtitle: 'Manage your finances and account',
                  trailingIcon: const Icon(Icons.chevron_right),
                  onTap: () =>
                      _showSnackbar(context, "finances and account tapped"),
                ),
                listTransaction: [
                  const TpeTransactionItemTw(
                    isLoading: false,
                    activityTitle: 'Transfer to BRI',
                    activityText: 'Transfer to BRI',
                    activityAmount: 'Rp 1.000.000',
                    activityDate: '12 Jan 2023',
                    activityIcon: 'assets/images/TRANSFER_NEW.png',
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
              ),
              promoSection: TpePromoSection(
                sectionHeaderPromo: TpeComponentSectionHeader(
                  title: 'Promo & Cashback',
                  subtitle: 'Penawaran khusus buat kamu',
                  leadingIcon: TPEBaseIconUrl(
                      iconUrl:
                          'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
                      size: 16),
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
          // CatalogItem(
          //     label: "TPEBiometricBottomSheet",
          //     icon: Icons.horizontal_split,
          //     destination: TPEBiometricBottomSheetPage()),
          // CatalogItem(
          //     label: "TPE Login TL",
          //     icon: Icons.horizontal_split,
          //     destination: TpeLoginPage()
          //     ),
          // CatalogItem(
          //     label: "TPELanguageBottomSheet",
          //     icon: Icons.menu,
          //     destination: const TpeOrganismLanguage()),
          // CatalogItem(
          //     label: "TPEPrimarySecondaryBottomSheet",
          //     icon: Icons.menu,
          //     destination: const TpeOrganismPrimarySecondaryBs()),
          // CatalogItem(
          //     label: "TPESingleButtonBottomSheet",
          //     icon: Icons.menu,
          //     destination: const TpeOrganismSingleButtonBottomSheet()),
        ],
      ),
    ];
  }
}
