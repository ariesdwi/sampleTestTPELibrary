import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/components/header/tpe_app_bar.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TpeMoleculeAppBar extends StatefulWidget {
  const TpeMoleculeAppBar({super.key});

  @override
  State<TpeMoleculeAppBar> createState() => _TpeMoleculeAppBarState();
}

class _TpeMoleculeAppBarState extends State<TpeMoleculeAppBar> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE App Bar"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              setState(() {
                showStorybook = !showStorybook;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TPEAppBar(
              title: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
