import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/button/tpe_navigation_card.dart';

class EyeToggleButton extends StatelessWidget {
  const EyeToggleButton({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Eye Toggle Button")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  [
            TPENavigationCardButton(
              text: "Lihat semua akun",
              onTap: (){},
            )
          ],
        ),
      ),
    );
  }
}
