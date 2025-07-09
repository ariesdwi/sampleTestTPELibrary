import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentSection extends StatelessWidget {
  const TPEComponentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Section")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TpeComponentSectionHeader(
            title: "Aktivitas Terbaru",
            subtitle: "Pantau aktivitas terbarumu",
          ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
