import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentCardBalance extends StatelessWidget {
  const TPEComponentCardBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Card Balance")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TPEBalanceCardTLType(
              accountNumber: '1234567890',
              currentBalance: 1000000,
              currency: 'USD',
            ),
            const SizedBox(height: 28),
            TpeBalanceCardTwType(
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1000000,
              copySuccessMessage: 'Account number copied successfully',
              copyTitleText: "Salin",
              titleBalanceText: "Saldo Rekening Utama",
              showCopy: true,
              textTitleBalanceStyle: TextStyle(
                color: TPEColors.yellow90,
                fontWeight: FontWeight.normal,
              ),
              textCopyStyle: TextStyle(color: TPEColors.black),
              style: TpeBalanceTwCardStyle(backgroundColor: TPEColors.blue10),
              seeAllCallback: () {
                print("Lihat Semua Rekening");
              },
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
