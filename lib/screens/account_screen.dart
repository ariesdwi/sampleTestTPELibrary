import 'package:flutter/material.dart';
import '../models/account_item.dart';
import '../models/account_section.dart';
import '../models/user_profile.dart';
import '../widgets/apple_style_account_view.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: AppleStyleAccountView(
        user: UserProfile(
          initials: "AP",
          fullName: "Aries Prasetiyo",
          email: "aries@example.com",
          points: 120,
        ),
        data: TpeBalanceCardData(
          accountNumber: '1234567890',
          currency: 'USD',
          currentBalance: 1000000,
          copySuccessMessage: 'Account number copied successfully',
          copyTitleText: "Salin",
          titleBalanceText: "Saldo Rekening Utama",
          showCopy: true,
        ),
        sections: _buildSections(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: TPERefineButton(
                title: "Batal",
                icon: Icons.close,
                variant: TPEButtonVariant.outline,
                size: TPEButtonSize.medium,
                roundType: TPEButtonRound.pill,
                isCentered: true,
                isEnabled: true,
                isLoading: false,
                onPressed: () {
                  debugPrint("Batal pressed!");
                },
              ),
            ),
            const SizedBox(width: 12), // spacing between buttons
            Expanded(
              child: TPERefineButton(
                title: "Simpan",
                icon: Icons.save,
                variant: TPEButtonVariant.primary,
                size: TPEButtonSize.medium,
                roundType: TPEButtonRound.pill,
                isCentered: true,
                isEnabled: true,
                isLoading: false,
                onPressed: () {
                  debugPrint("Simpan pressed!");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<AccountSection> _buildSections() {
    return [
      AccountSection(
        items: [
          AccountItem(icon: Icons.list_alt, label: "Fast Menu"),
          AccountItem(icon: Icons.account_box, label: "Update Rekening"),
          AccountItem(icon: Icons.credit_card, label: "Pengelolaan Kartu"),
          AccountItem(icon: Icons.qr_code, label: "Sumber Dana QRIS"),
          AccountItem(icon: Icons.language, label: "Bahasa"),
          AccountItem(icon: Icons.description, label: "Terima Tagihan"),
          AccountItem(icon: Icons.security, label: "Transaction Limit"),
          AccountItem(
            icon: Icons.notifications_active,
            label: "Manage Notification",
          ),
        ],
      ),
      AccountSection(
        items: [
          AccountItem(icon: Icons.lock_reset, label: "Ubah Pin"),
          AccountItem(icon: Icons.vpn_key, label: "Ubah Password"),
          AccountItem(icon: Icons.fingerprint, label: "Login Fingerprint"),
          AccountItem(icon: Icons.lock_open, label: "Transaksi Tanpa PIN"),
        ],
      ),
      AccountSection(
        items: [
          AccountItem(icon: Icons.help, label: "Pusat Bantuan"),
          AccountItem(icon: Icons.chat, label: "Chat Banking"),
          AccountItem(icon: Icons.phone, label: "Layanan Bebas Pulsa"),
          AccountItem(icon: Icons.contact_phone, label: "Kontak Kami"),
        ],
      ),
      AccountSection(
        items: [
          AccountItem(icon: Icons.perm_identity, label: "Data Anda (KTP)"),
          AccountItem(icon: Icons.phone_android, label: "Ubah No Handphone"),
          AccountItem(
            icon: Icons.credit_card,
            label: "Kartu Debit & Kartu Kredit",
          ),
          AccountItem(
            icon: Icons.compare_arrows,
            label: "Jenis & Limit Transaksi",
          ),
          AccountItem(icon: Icons.attach_money, label: "Info Kurs"),
          AccountItem(icon: Icons.show_chart, label: "Info Saham BRI"),
          AccountItem(icon: Icons.location_on, label: "Lokasi ATM BRI"),
          AccountItem(icon: Icons.apartment, label: "Lokasi Kantor BRI"),
          AccountItem(icon: Icons.info, label: "Tentang BRIMO"),
          AccountItem(icon: Icons.delete, label: "Delete Account"),
        ],
      ),
      AccountSection(
        items: [AccountItem(icon: Icons.palette, label: "Theme")],
      ),
      AccountSection(
        items: [AccountItem(icon: Icons.logout, label: "Logut")],
      ),
    ];
  }
}
