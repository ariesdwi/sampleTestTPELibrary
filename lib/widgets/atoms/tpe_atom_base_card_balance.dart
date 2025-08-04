import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/card/tpe_base_balance_card/tpe_base_balance_card.dart';

class BalanceBaseCard extends StatelessWidget {
  const BalanceBaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Base Card")),
      body: SizedBox(
        height: 120,
        child: TPEBaseBalanceCard(
          width: double.infinity,
          backgroundImage: 'assets/images/Taiwan_card_image_2.png',
          backgroundColor: Colors.yellow,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          margin: const EdgeInsets.all(16),
          borderRadius: 16,
          child: Column(
            children: [
              Text("Saldo Anda"),
              SizedBox(height: 8),
              Text("Rp 1.000.000"),
            ],
          ),
        ),
      ),
    );
  }
}
