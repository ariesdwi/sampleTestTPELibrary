import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class TPEComponentTextGroupStorybook extends StatefulWidget {
  const TPEComponentTextGroupStorybook({super.key});

  @override
  State<TPEComponentTextGroupStorybook> createState() =>
      _TPEComponentTextGroupStorybookState();
}

class _TPEComponentTextGroupStorybookState
    extends State<TPEComponentTextGroupStorybook> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Text Group"),
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
                  name: 'TPETextGroup / Customizable',
                  builder: (context) {
                    final title = context.knobs.text(
                      label: 'Title',
                      initial: 'Welcome to TPE!',
                    );

                    final description = context.knobs.text(
                      label: 'Description',
                      initial: 'Explore all the features now.',
                    );

                    final alignment = context.knobs.options<MainAxisAlignment>(
                      label: 'Alignment',
                      initial: MainAxisAlignment.center,
                      options: const [
                        Option(label: 'Start', value: MainAxisAlignment.start),
                        Option(label: 'Center', value: MainAxisAlignment.center),
                        Option(label: 'End', value: MainAxisAlignment.end),
                        Option(label: 'Space Around', value: MainAxisAlignment.spaceAround),
                        Option(label: 'Space Between', value: MainAxisAlignment.spaceBetween),
                        Option(label: 'Space Evenly', value: MainAxisAlignment.spaceEvenly),
                      ],
                    );

                    final titleVariant = context.knobs.options<TPETextVariant>(
                      label: 'Title Style',
                      initial: TPETextVariant.text16Bold,
                      options: const [
                        Option(label: 'text14SemiBold600', value: TPETextVariant.text14SemiBold600),
                        Option(label: 'text16Bold', value: TPETextVariant.text16Bold),
                        Option(label: 'text18Bold', value: TPETextVariant.text16SemiBold600),
                        Option(label: 'text20Bold', value: TPETextVariant.text20SemiBold700),
                      ],
                    );

                    final descVariant = context.knobs.options<TPETextVariant>(
                      label: 'Description Style',
                      initial: TPETextVariant.text14SemiBold600,
                      options: const [
                        Option(label: 'text14SemiBold600', value: TPETextVariant.text14SemiBold600),
                        Option(label: 'text12Regular', value: TPETextVariant.secondary),
                        Option(label: 'text16Regular', value: TPETextVariant.primary),
                        Option(label: 'text16SemiBold', value: TPETextVariant.text16SemiBold600),
                      ],
                    );

                    return Center(
                      child: TPETextGroup(
                        title: title,
                        description: description,
                        alignment: alignment,
                        titleStyle: TPEText(
                          text: title,
                          variant: titleVariant,
                          textAlign: TextAlign.center,
                        ),
                        descriptionStyle: TPEText(
                          text: description,
                          variant: descVariant,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          : Center(
              child: TPETextGroup(
                title: 'Default Title',
                description: 'This is the default description.',
              ),
            ),
    );
  }
}


