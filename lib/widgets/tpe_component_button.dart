import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentButton extends StatelessWidget {
  const TPEComponentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Primary Button")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TPERefineButton(
              title: "Simpan",
              icon: Icons.save,
              variant: TPEButtonVariant.primary,
              size: TPEButtonSize.medium,
              roundType: TPEButtonRound.pill,
              isCentered: true,
              isEnabled: true,
              isLoading: false,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Simpan pressed!")),
                );
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
