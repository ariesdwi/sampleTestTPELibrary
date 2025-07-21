import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Base Card")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            TPEBaseCard(width: 100, height: 100),

            TPEBaseCard(
              backgroundColor: Colors.yellow,
              width: 200,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
