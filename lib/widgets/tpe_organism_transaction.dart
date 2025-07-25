import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/section/tpe_transaction_section.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TransactionItemList extends StatelessWidget {
  const TransactionItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Transaction List")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TpeTransactionSection(
              sectionHeader: TpeComponentSectionHeader(
                leadingIcon: TPEBaseIconUrl(iconUrl: 'https://cdn-icons-png.flaticon.com/512/4256/4256863.png'),
                title: 'Transaction Menu',
                subtitle: 'Manage your finances and account',
                trailingIcon: const Icon(Icons.chevron_right),
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
            ),
          ],
        ),
      ),
    );
  }
}
