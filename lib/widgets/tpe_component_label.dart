import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentLabel extends StatelessWidget {
  const TPEComponentLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Label Success and Fail")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
          ],
        ),
      ),
    );
  }
}
