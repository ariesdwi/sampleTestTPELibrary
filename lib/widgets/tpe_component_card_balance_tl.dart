import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentCardBalanceTL extends StatefulWidget {
  const TPEComponentCardBalanceTL({super.key});

  @override
  State<TPEComponentCardBalanceTL> createState() =>
      _TPEComponentCardBalanceState();
}

class _TPEComponentCardBalanceState extends State<TPEComponentCardBalanceTL> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Card Balance")),
      body: Center(
        child: TPEBalanceCardTL(
          accountNumber: '1234567890',
          currency: 'USD',
          currentBalance: 1234.56,
          isLoading: isLoading,
        )
      ),
    );
  }
}
