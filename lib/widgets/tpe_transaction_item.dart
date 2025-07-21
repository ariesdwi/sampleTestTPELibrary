import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Text Variant")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TpeTransactionItemTw(
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
      ),
    );
  }
}
