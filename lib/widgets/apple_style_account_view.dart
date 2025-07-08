import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../models/account_section.dart';
import '../models/account_item.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class AppleStyleAccountView extends StatelessWidget {
  final UserProfile user;
  final List<AccountSection> sections;
  final TpeBalanceCardData data;

  const AppleStyleAccountView({
    super.key,
    required this.user,
    required this.sections,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 24),
        _buildHeader(),
        const SizedBox(height: 16),
        ...sections.map((section) => _buildSection(section)),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blue.withOpacity(0.2),
          child: Text(
            user.initials,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        const SizedBox(height: 8),
        CircleIconButton(
          icon: Icons.shopping_cart,
          onPressed: () {
            debugPrint("Simpan pressed!");
          },
        ),
        const SizedBox(height: 8),
        CircleIconButton(
          icon: Icons.notifications,
          badgeCount: 3,
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        TPELabelChip(
          label: 'Sukses',
          backgroundColor: const Color.fromRGBO(225, 248, 235, 1),
          textColor: const Color.fromRGBO(39, 174, 96, 1),
          borderRadius: BorderRadius.circular(4),
        ),
        const SizedBox(height: 8),
        TPELabelChip(
          label: 'Gagal',
          backgroundColor: const Color.fromRGBO(252, 231, 231, 1),
          textColor: const Color.fromRGBO(232, 64, 64, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        const SizedBox(height: 28),
        TPEHomeMenuItem(
          title: 'Transfer',
          icon: Icon(Icons.money, size: 28, color: Colors.blue),
          isNew: true,
          onTap: () {
            debugPrint('Transfer menu tapped!');
          },
        ),
        const SizedBox(height: 28),
        TPEHorizontalMenuItem(
          icon: Icon(Icons.attach_money, color: Colors.blue),
          title: 'Transfer',
          subtitle: 'Transfer money securely to any domestic bank account',
          onTap: () {
            debugPrint('Transfer tapped');
          },
        ),
        TPEBalanceCardTLType(
          data: data,
          backgroundColor: TPEColors.blue100,
          showBalanceToggle: true,
        ),
        TpeBalanceCardTwType(data: data, backgroundColor: TPEColors.white),
        const SizedBox(height: 28),
        Text(
          user.fullName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          user.email,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Text(
          "${user.points} Poin",
          style: const TextStyle(fontSize: 14, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _buildSection(AccountSection section) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: section.items.map((item) {
            return Column(
              children: [
                ListTile(
                  leading: Icon(item.icon, color: Colors.blue),
                  title: Text(item.label),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 1, thickness: 0.5),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
