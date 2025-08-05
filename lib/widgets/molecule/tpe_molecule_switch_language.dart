import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPESwitchLanguageStorybook extends StatefulWidget {
  const TPESwitchLanguageStorybook({super.key});

  @override
  State<TPESwitchLanguageStorybook> createState() =>
      _TPESwitchLanguageStorybookState();
}

class _TPESwitchLanguageStorybookState
    extends State<TPESwitchLanguageStorybook> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Switch Language"),
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
              wrapperBuilder: (context, child) =>
                  Padding(padding: const EdgeInsets.all(16), child: child),
              stories: [
                Story(
                  name: 'TPESwitchLanguage / Default',
                  builder: (context) {
                    final countryCode = context.knobs.text(
                      label: 'Country Code',
                      initial: 'US',
                    );

                    final width = context.knobs.slider(
                      label: 'Width',
                      initial: 85,
                      min: 50,
                      max: 200,
                    );

                    final height = context.knobs.slider(
                      label: 'Height',
                      initial: 30,
                      min: 20,
                      max: 80,
                    );

                    final backgroundColor = context.knobs.options<Color>(
                      label: 'Background Color',
                      initial: Colors.transparent,
                      options: const [
                        Option(label: 'Transparent', value: Colors.transparent),
                        Option(label: 'Blue', value: Colors.blue),
                        Option(label: 'Red', value: Colors.red),
                        Option(label: 'Grey', value: Colors.grey),
                      ],
                    );

                    final textColor = context.knobs.options<Color>(
                      label: 'Text Color',
                      initial: Colors.black,
                      options: const [
                        Option(label: 'Black', value: Colors.black),
                        Option(label: 'White', value: Colors.white),
                        Option(label: 'Blue', value: Colors.blue),
                      ],
                    );

                    final iconColor = context.knobs.options<Color>(
                      label: 'Icon Color',
                      initial: Colors.black,
                      options: const [
                        Option(label: 'Black', value: Colors.black),
                        Option(label: 'Grey', value: Colors.grey),
                        Option(label: 'Blue', value: Colors.blue),
                      ],
                    );

                    return TPESwitchLanguage(
                      countryCode: countryCode,
                      width: width,
                      height: height,
                      backgroundColor: backgroundColor,
                      textColor: textColor,
                      iconColor: iconColor,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Tapped on $countryCode'),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Default Switch Language Preview'),
                  const SizedBox(height: 16),
                  TPESwitchLanguage(
                    countryCode: 'US',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Switch tapped")),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
