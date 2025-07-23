import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentHeader extends StatelessWidget {
  const TPEComponentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Header")),
      body: Container(
        color: const Color.fromARGB(255, 112, 97, 96), 
        child: Center(

          child:
           TPEHeaderComponent(
            userName: 'Aries',
            rightCircleButton: 
            TPECircleIconButton(
              icon: Icons.logout_outlined,
              onPressed: () => debugPrint(" tapped"),
            ),
          ),
        ),
      ),
    );
  }
}
