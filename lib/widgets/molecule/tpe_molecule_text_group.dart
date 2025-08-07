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
                      initial:
                          'To open a new account, please visit BRI branch office. New account registrations can only be processed at our branch office.',
                    );

                    final alignment = context.knobs.options<MainAxisAlignment>(
                      label: 'Alignment',
                      initial: MainAxisAlignment.center,
                      options: const [
                        Option(label: 'Start', value: MainAxisAlignment.start),
                        Option(
                            label: 'Center', value: MainAxisAlignment.center),
                        Option(label: 'End', value: MainAxisAlignment.end),
                        Option(
                            label: 'Center',
                            value: MainAxisAlignment.center),
                        Option(
                            label: 'Start',
                            value: MainAxisAlignment.start),
                        Option(
                            label: 'End',
                            value: MainAxisAlignment.end),
                      ],
                    );

                    final titleStyle = context.knobs.options<TPEText>(
                      label: 'Title Style',
                      initial: TPEText(
                        text: "Title Style Black text16SemiBold600",
                        variant: TPETextVariant.text16SemiBold600,
                        color: Colors.black,
                      ),
                      options: const [
                        Option(
                            label: "Title Style Black text14SemiBold600",
                            value: TPEText(
                              text: "Title Style Black text16SemiBold600",
                              variant: TPETextVariant.text16SemiBold600,
                              color: Colors.black,
                            )),
                        Option(
                            label: 'Title Style red secondary',
                            value: TPEText(
                              text: "Title Style red text16SemiBold600",
                              variant: TPETextVariant.secondary,
                              color: Colors.red,
                            )),
                        Option(
                            label: 'Title Style yellow primary',
                            value: TPEText(
                              text: "Title Style yellow text16SemiBold600",
                              variant: TPETextVariant.primary,
                              color: Colors.yellow,
                            )),
                        Option(
                            label: 'Title Style pink text20Bold',
                            value: TPEText(
                              text: "Title Style pink text16SemiBold600",
                              variant: TPETextVariant.text20SemiBold700,
                              color: Colors.pink,
                            )),
                      ],
                    );

                    final descStyle = context.knobs.options<TPEText>(
                      label: 'Description Style',
                      initial: TPEText(
                        text: "Description Style Black text16SemiBold600",
                        variant: TPETextVariant.secondary,
                        color: Colors.black,
                      ),
                      options: const [
                        Option(
                            label: "Description Style Black text14SemiBold600",
                            value: TPEText(
                              text: "Description Black text16SemiBold600",
                              variant: TPETextVariant.text16SemiBold600,
                              color: Colors.black,
                            )),
                        Option(
                            label: 'Description Style red secondary',
                            value: TPEText(
                              text: "Description red secondary",
                              variant: TPETextVariant.secondary,
                              color: Colors.red,
                            )),
                        Option(
                            label: 'Description Style yellow primary',
                            value: TPEText(
                              text: "Description yellow Primary",
                              variant: TPETextVariant.primary,
                              color: Colors.yellow,
                            )),
                        Option(
                            label: 'Description Style pink text20Bold',
                            value: TPEText(
                              text: "Description pink text20SemiBold700",
                              variant: TPETextVariant.text20SemiBold700,
                              color: Colors.pink,
                            )),
                      ],
                    );

                    return Center(
                      child: TPETextGroup(
                        title: title,
                        description: description,
                        titleStyle: titleStyle,
                        alignment: alignment,
                        descriptionStyle: descStyle,
                      ),
                    );
                  },
                ),
              ],
            )
          : Center(
              child: TPETextGroup(
                title: 'Default Title',
                description:
                    'To open a new account, please visit BRI branch office. New account registrations can only be processed at our branch office.',
              ),
            ),
    );
  }
}
