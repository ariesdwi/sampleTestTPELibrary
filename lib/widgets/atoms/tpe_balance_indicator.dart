import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEBalanceDot extends StatelessWidget {
  const TPEBalanceDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Balance Indicator")),
      body: Center(
        child: TPEBalanceIndicator()
      ),
    );
  }
}
