import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/icon/tpe_icon_base.dart';

class BaseIcon extends StatelessWidget {
  const BaseIcon({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Base Icon")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  [
            TPEBaseIcon(
              icon: Icons.star,
              size: 50,
              color: Colors.blue,
            ),
            TPEBaseIcon(
              icon: Icons.favorite,
              size: 50,
              color: Colors.red,
            ),
            TPEBaseIcon(
              icon: Icons.home,
              size: 50,
              color: Colors.green,)
          ],
        ),
      ),
    );
  }
}
