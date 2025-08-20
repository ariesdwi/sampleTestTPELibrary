import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/components/section/tpe_confirmation_section.dart';
import 'package:tpe_component_sdk/components/text/tpe_text_group.dart';

class TpeMoleculeConfirmationSection extends StatefulWidget {
  const TpeMoleculeConfirmationSection({super.key});

  @override
  State<TpeMoleculeConfirmationSection> createState() =>
      _TpeMoleculeConfirmationSectionState();
}

class _TpeMoleculeConfirmationSectionState
    extends State<TpeMoleculeConfirmationSection> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Confirmation Section"),
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
                /// 📌 Default Confirmation Section
                Story(
                  name: 'TPEConfirmationSection / Default',
                  builder: (context) => Center(
                    child: TPEConfirmationSection(
                      imageUrl: 'https://via.placeholder.com/200',
                      content: const TPETextGroup(
                        title: "Account Access Blocked",
                        description:
                            "Your username or password was entered incorrectly 3 times. Recover your account below or check your email for further information.",
                      ),
                    ),
                  ),
                ),

                /// 📌 Custom Background
                Story(
                  name: 'TPEConfirmationSection / Custom Background',
                  builder: (context) => Center(
                    child: TPEConfirmationSection(
                      imageUrl: 'https://via.placeholder.com/200',
                      backgroundColor: Colors.amber.shade100,
                      content: const TPETextGroup(
                        title: "Warning",
                        description:
                            "This is a custom background example for confirmation section.",
                      ),
                    ),
                  ),
                ),

                /// 📌 Custom Image Size
                Story(
                  name: 'TPEConfirmationSection / Custom Image Size',
                  builder: (context) => Center(
                    child: TPEConfirmationSection(
                      imageUrl: 'https://via.placeholder.com/150',
                      imageSize: 100.0,
                      content: const TPETextGroup(
                        title: "Small Image",
                        description:
                            "Here the image is smaller (100px instead of 200px).",
                      ),
                    ),
                  ),
                ),

                /// 📌 Knobs Playground
                Story(
                  name: 'TPEConfirmationSection / Knobs Playground',
                  builder: (context) {
                    final k = context.knobs;

                    return Center(
                      child: TPEConfirmationSection(
                        imageUrl: k.text(
                          label: 'Image URL',
                          initial: 'https://via.placeholder.com/200',
                        ),
                        imageSize: k.slider(
                          label: 'Image Size',
                          initial: 200,
                          min: 50,
                          max: 300,
                        ),
                        backgroundColor: k.options<Color>(
                          label: 'Background Color',
                          initial: Colors.white,
                          options: const [
                            Option(label: 'White', value: Colors.white),
                            Option(label: 'Amber', value: Colors.amber),
                            Option(
                                label: 'Light Blue',
                                value: Colors.lightBlueAccent),
                            Option(label: 'Grey', value: Colors.grey),
                          ],
                        ),
                        content: TPETextGroup(
                          title: k.text(
                            label: 'Title',
                            initial: "Account Access Blocked",
                          ),
                          description: k.text(
                            label: 'Description',
                            initial:
                                "Your username or password was entered incorrectly 3 times. Recover your account below or check your email for further information.",
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          : Center(
              child: TPEConfirmationSection(
                imageUrl: 'h://via.placeholder.c00',
                content: const TPETextGroup(
                  title: "Account Access Blocked",
                  description:
                      "Your username or password was entered incorrectly 3 times. Recover your account below or check your email for further information.",
                ),
              ),
            ),
    );
  }
}
