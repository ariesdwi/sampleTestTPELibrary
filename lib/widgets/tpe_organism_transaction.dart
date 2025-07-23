import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/card/tpe_transaction_card/tpe_transaction_list.dart';
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
            TPETransactionList(
              listTransaction: [
                TpeTransactionItemTw(
                  isLoading: false,
                  activityTitle: 'Transfer to BRI',
                  activityText: 'Transfer to BRI',
                  activityAmount: 'Rp 1.000.000',
                  activityDate: '12 Jan 2023',
                  activityIcon: 'assets/images/TRANSFER_NEW.png',
                  activityStatus: 2,
                ),
                TpeTransactionItemTw(
                  isLoading: false,
                  activityTitle: 'Payment to Telkomsel',
                  activityText: 'Payment to Telkomsel',
                  activityAmount: 'Rp 500.000',
                  activityDate: '13 Jan 2023',
                  activityIcon: 'assets/images/PAYMENT_NEW.png',
                  activityStatus: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
