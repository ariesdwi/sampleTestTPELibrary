import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentCardBalance extends StatelessWidget {
  const TPEComponentCardBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Card Balance")),
      body: Center(
        child: ListView(
          children: [
            TPEBalanceCardTL(
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1234.56,
            ),
            const SizedBox(height: 28),

            TPEBalanceCard(
              type: TPEBalanceCardType.tw,
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1234.56,
              onSeeAll: () {
                // Handle see all
              },
            ),

            TPEBalanceCardTW(
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1234.56,
              onSeeAll: () {
                // Handle see all
              },
            ),

            TPEBalanceCardTW(
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1234.56,
              backgroundColor: TPEColors.blue80,
              balanceIndicator: TPEBalanceIndicator(color: TPEColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
