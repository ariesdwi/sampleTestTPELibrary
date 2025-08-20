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
      body: showStorybook
          ? Storybook(
              stories: [
                /// 📌 Default
                Story(
                  name: 'TPEAppBar / Default',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title: 'Default AppBar',
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                /// 📌 With Back Button
                Story(
                  name: 'TPEAppBar / With Back Button',
                  builder: (context) => Scaffold(
                    appBar: TPEAppBar(
                      title: 'With Back Button',
                      useBackButton: true,
                      onPressed: () => debugPrint("Back pressed"),
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                /// 📌 Without Back Button
                Story(
                  name: 'TPEAppBar / Without Back Button',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title: 'No Back Button',
                      useBackButton: false,
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                /// 📌 Custom Background
                Story(
                  name: 'TPEAppBar / Custom Background',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title: 'Custom BG',
                      backgroundColor: Colors.deepOrange,
                      useBackButton: false,
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                /// 📌 Knobs Interaktif
                Story(
                  name: 'TPEAppBar / Knobs Playground',
                  builder: (context) {
                    final k = context.knobs;

                    return Scaffold(
                      appBar: TPEAppBar(
                        title: k.text(label: 'Title', initial: 'TPE App Bar'),
                        useBackButton: k.boolean(
                          label: 'Use Back Button',
                          initial: true,
                        ),
                        automaticallyImplyLeading: k.boolean(
                          label: 'Automatically Imply Leading',
                          initial: false,
                        ),
                        backgroundColor: k.options(
                          label: 'Background Color',
                          initial: TPEColors.blue70,
                          options: const [
                            Option(label: 'Blue70', value: TPEColors.blue70),
                            Option(label: 'Red', value: Colors.red),
                            Option(label: 'Green', value: Colors.green),
                            Option(label: 'Orange', value: Colors.orange),
                          ],
                        ),
                        onPressed: () => debugPrint("Back button pressed!"),
                      ),
                      body: const Center(
                        child: Text("Edit values via knobs →"),
                      ),
                    );
                  },
                ),
              ],
            )
          : const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
