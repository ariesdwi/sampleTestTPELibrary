import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class MenuBadgeLabel extends StatelessWidget {
  const MenuBadgeLabel({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Menu Badge Label")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: TPEMenuBadgeLabel()
        ),
      ),
    );
  }
}
