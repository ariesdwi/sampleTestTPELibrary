import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/components/button/tpe_primary_secondary_button.dart';

class TpeMoleculePrimarySecondaryBtn extends StatefulWidget {
  const TpeMoleculePrimarySecondaryBtn({super.key});

  @override
  State<TpeMoleculePrimarySecondaryBtn> createState() =>
      _TpeMoleculePrimarySecondaryBtnState();
}

class _TpeMoleculePrimarySecondaryBtnState
    extends State<TpeMoleculePrimarySecondaryBtn> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Primary Secondary Button"),
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
                /// 📌 Default Button
                Story(
                  name: 'TPEPrimarySecondaryButton / Default',
                  builder: (context) => Center(
                    child: TPEPrimarySecondaryButton(
                      onPrimaryButtonPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Primary Button pressed"),
                          ),
                        );
                      },
                      onSecondaryButtonPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Secondary Button pressed"),
                          ),
                        );
                      },
                      primaryButtonText: 'Primary Button',
                      secondaryButtonText: "Secondary Button",
                    ),
                  ),
                ),

                /// 📌 Custom Label
                Story(
                  name: 'TPEPrimarySecondaryButton / Custom Label',
                  builder: (context) => Center(
                    child: TPEPrimarySecondaryButton(
                      onPrimaryButtonPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Ya ditekan"),
                          ),
                        );
                      },
                      onSecondaryButtonPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Tidak ditekan"),
                          ),
                        );
                      },
                      primaryButtonText: 'Ya',
                      secondaryButtonText: "Tidak",
                    ),
                  ),
                ),

                /// 📌 Knobs Playground
                Story(
                  name: 'TPEPrimarySecondaryButton / Knobs Playground',
                  builder: (context) {
                    final k = context.knobs;

                    return Center(
                      child: TPEPrimarySecondaryButton(
                        onPrimaryButtonPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Primary Button pressed"),
                            ),
                          );
                        },
                        onSecondaryButtonPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Secondary Button pressed"),
                            ),
                          );
                        },
                        primaryButtonText: k.text(
                          label: 'Primary Button Text',
                          initial: 'Confirm',
                        ),
                        secondaryButtonText: k.text(
                          label: 'Secondary Button Text',
                          initial: 'Cancel',
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TPEPrimarySecondaryButton(
                    onPrimaryButtonPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Primary Button pressed"),
                        ),
                      );
                    },
                    onSecondaryButtonPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Secondary Button pressed"),
                        ),
                      );
                    },
                    primaryButtonText: 'Primary Button',
                    secondaryButtonText: "Secondary Button",
                  ),
                ],
              ),
            ),
    );
  }
}
