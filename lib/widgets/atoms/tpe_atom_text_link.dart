import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentLinkTextStorybook extends StatefulWidget {
  const TPEComponentLinkTextStorybook({super.key});

  @override
  State<TPEComponentLinkTextStorybook> createState() =>
      _TPEComponentLinkTextStorybookState();
}

class _TPEComponentLinkTextStorybookState
    extends State<TPEComponentLinkTextStorybook> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Link Text"),
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
                  name: 'TPELinkText / Default',
                  builder: (context) {
                    final label = context.knobs.text(
                      label: 'Text',
                      initial: 'Click here',
                    );

                    final color = context.knobs.options<Color>(
                      label: 'Text Color',
                      initial: Colors.blue,
                      options: const [
                        Option(label: 'Blue', value: Colors.blue),
                        Option(label: 'Red', value: Colors.red),
                        Option(label: 'Green', value: Colors.green),
                        Option(label: 'Black', value: Colors.black),
                      ],
                    );

                    return TPELinkText(
                      text: label,
                      color: color,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Link tapped')),
                        );
                      },
                    );
                  },
                ),
              ],
            )
          : Center(
              child: TPELinkText(
                text: "Click here",
                color: Colors.blue,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Link tapped')),
                  );
                },
              ),
            ),
    );
  }
}
