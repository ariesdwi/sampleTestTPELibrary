// import 'package:flutter/material.dart';
// import 'package:storybook_flutter/storybook_flutter.dart';
// import 'package:tpe_component_sdk/components/section/tpe_confirmation_section.dart';
// import 'package:tpe_component_sdk/components/text/tpe_text_group.dart';

// class TpeMoleculeConfirmationSection extends StatefulWidget {
//   const TpeMoleculeConfirmationSection({super.key});

//   @override
//   State<TpeMoleculeConfirmationSection> createState() =>
//       _TpeMoleculeConfirmationSectionState();
// }

// class _TpeMoleculeConfirmationSectionState
//     extends State<TpeMoleculeConfirmationSection> {
//   bool showStorybook = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("TPE Confirmation Section"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings),
//             onPressed: () {
//               setState(() {
//                 showStorybook = !showStorybook;
//               });
//             },
//           ),
//         ],
//       ),
//       body: showStorybook
//           ? Storybook(
//               stories: [
//                 /// 📌 Default Confirmation Section
//                 Story(
//                   name: 'TPEConfirmationSection / Default',
//                   builder: (context) => Center(
//                     child: TPEConfirmationSection(
//                       imageUrl: 'https://via.placeholder.com/200',
//                       content: const TPETextGroup(
//                         title: "Account Access Blocked",
//                         description:
//                             "Your username or password was entered incorrectly 3 times. Recover your account below or check your email for further information.",
//                       ),
//                     ),
//                   ),
//                 ),

//                 /// 📌 Custom Background
//                 Story(
//                   name: 'TPEConfirmationSection / Custom Background',
//                   builder: (context) => Center(
//                     child: TPEConfirmationSection(
//                       imageUrl: 'https://via.placeholder.com/200',
//                       backgroundColor: Colors.amber.shade100,
//                       content: const TPETextGroup(
//                         title: "Warning",
//                         description:
//                             "This is a custom background example for confirmation section.",
//                       ),
//                     ),
//                   ),
//                 ),

//                 /// 📌 Custom Image Size
//                 Story(
//                   name: 'TPEConfirmationSection / Custom Image Size',
//                   builder: (context) => Center(
//                     child: TPEConfirmationSection(
//                       imageUrl: 'https://via.placeholder.com/150',
//                       imageSize: 100.0,
//                       content: const TPETextGroup(
//                         title: "Small Image",
//                         description:
//                             "Here the image is smaller (100px instead of 200px).",
//                       ),
//                     ),
//                   ),
//                 ),

//                 /// 📌 Knobs Playground
//                 Story(
//                   name: 'TPEConfirmationSection / Knobs Playground',
//                   builder: (context) {
//                     final k = context.knobs;

//                     return Center(
//                       child: TPEConfirmationSection(
//                         imageUrl: k.text(
//                           label: 'Image URL',
//                           initial: 'https://via.placeholder.com/200',
//                         ),
//                         imageSize: k.slider(
//                           label: 'Image Size',
//                           initial: 200,
//                           min: 50,
//                           max: 300,
//                         ),
//                         backgroundColor: k.options<Color>(
//                           label: 'Background Color',
//                           initial: Colors.white,
//                           options: const [
//                             Option(label: 'White', value: Colors.white),
//                             Option(label: 'Amber', value: Colors.amber),
//                             Option(
//                                 label: 'Light Blue',
//                                 value: Colors.lightBlueAccent),
//                             Option(label: 'Grey', value: Colors.grey),
//                           ],
//                         ),
//                         content: TPETextGroup(
//                           title: k.text(
//                             label: 'Title',
//                             initial: "Account Access Blocked",
//                           ),
//                           description: k.text(
//                             label: 'Description',
//                             initial:
//                                 "Your username or password was entered incorrectly 3 times. Recover your account below or check your email for further information.",
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             )
//           : Center(
//               child: TPEConfirmationSection(
//                 imageUrl: 'h://via.placeholder.c00',
//                 content: const TPETextGroup(
//                   title: "Account Access Blocked",
//                   description:
//                       "Your username or password was entered incorrectly 3 times. Recover your account below or check your email for further information.",
//                 ),
//               ),
//             ),
//     );
//   }
// }

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
                /// 📌 Default Confirmation Section with Local Asset
                Story(
                  name: 'TPEConfirmationSection / Local Asset',
                  builder: (context) => const Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TPEConfirmationSection(
                          imageUrl:
                              'packages/tpe_component_sdk/assets/images/img_account_blocked.png',
                          content: TPETextGroup(
                            title: "Account Access Blocked",
                            description:
                                "Your username or password was entered incorrectly 3 times. Recover your account below or check your email for further information.",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// 📌 Local Asset with Custom Background
                Story(
                  name: 'TPEConfirmationSection / Local Asset with Background',
                  builder: (context) => const Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TPEConfirmationSection(
                          imageUrl:
                              'packages/tpe_component_sdk/assets/images/img_account_blocked.png',
                          backgroundColor: Colors.redAccent,
                          content: TPETextGroup(
                            title: "Security Alert",
                            description:
                                "Your account has been temporarily blocked due to security reasons. Please contact support for assistance.",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// 📌 Network Image Example
                Story(
                  name: 'TPEConfirmationSection / Network Image',
                  builder: (context) => const Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TPEConfirmationSection(
                          imageUrl: 'https://picsum.photos/200/200',
                          content: TPETextGroup(
                            title: "Network Image Example",
                            description:
                                "This example shows how network images are handled alongside local assets in the same component.",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// 📌 No Image Example
                Story(
                  name: 'TPEConfirmationSection / No Image',
                  builder: (context) => const Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TPEConfirmationSection(
                          content: TPETextGroup(
                            title: "Text Only Section",
                            description:
                                "This confirmation section doesn't include any image, showing only the text content.",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// 📌 Custom Image Size with Local Asset
                Story(
                  name: 'TPEConfirmationSection / Custom Size',
                  builder: (context) => const Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TPEConfirmationSection(
                          imageUrl:
                              'packages/tpe_component_sdk/assets/images/img_account_blocked.png',
                          imageSize: 150.0,
                          backgroundColor: Colors.blueAccent,
                          content: TPETextGroup(
                            title: "Custom Size Example",
                            description:
                                "The local asset image is displayed at 150px instead of the default 200px size.",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// 📌 Error Handling Example
                Story(
                  name: 'TPEConfirmationSection / Error Handling',
                  builder: (context) => const Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TPEConfirmationSection(
                          imageUrl: 'https://invalid-url.com/image.jpg',
                          content: TPETextGroup(
                            title: "Error Handling Demo",
                            description:
                                "This demonstrates the component's error handling when an image fails to load.",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// 📌 Interactive Playground
                Story(
                  name: 'TPEConfirmationSection / Playground',
                  builder: (context) {
                    final k = context.knobs;

                    // Predefined image options
                    final imageOptions = k.options<String>(
                      label: 'Image Source',
                      initial:
                          'packages/tpe_component_sdk/assets/images/img_account_blocked.png',
                      options: [
                        const Option(
                          label: 'Local Asset (Account Blocked)',
                          value:
                              'packages/tpe_component_sdk/assets/images/img_account_blocked.png',
                        ),
                        const Option(
                          label: 'Network Image 1',
                          value: 'https://picsum.photos/200/200',
                        ),
                        const Option(
                          label: 'Network Image 2',
                          value: 'https://picsum.photos/250/250?grayscale',
                        ),
                        const Option(
                          label: 'Network Image 3',
                          value: 'https://picsum.photos/200/200?blur=2',
                        ),
                        const Option(
                          label: 'Invalid URL (Test Error)',
                          value: 'https://invalid-url.com/image.jpg',
                        ),
                        const Option(
                          label: 'No Image',
                          value: '',
                        ),
                      ],
                    );

                    return Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TPEConfirmationSection(
                            imageUrl:
                                imageOptions.isNotEmpty ? imageOptions : null,
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
                                Option(
                                    label: 'Red Accent',
                                    value: Colors.redAccent),
                                Option(
                                    label: 'Blue Accent',
                                    value: Colors.blueAccent),
                                Option(
                                    label: 'Green Accent',
                                    value: Colors.greenAccent),
                                Option(
                                    label: 'Amber Accent',
                                    value: Colors.amberAccent),
                                Option(label: 'Light Grey', value: Colors.grey),
                                Option(
                                    label: 'Transparent',
                                    value: Colors.transparent),
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
                        ),
                      ),
                    );
                  },
                ),

                /// 📌 Advanced Playground with Custom URL Input
                Story(
                  name: 'TPEConfirmationSection / Advanced Playground',
                  builder: (context) {
                    final k = context.knobs;

                    return Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TPEConfirmationSection(
                            imageUrl: k.text(
                              label: 'Custom Image URL',
                              initial:
                                  'packages/tpe_component_sdk/assets/images/img_account_blocked.png',
                              description:
                                  'Enter any URL or use the local asset path',
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
                                Option(label: 'Red', value: Colors.red),
                                Option(label: 'Blue', value: Colors.blue),
                                Option(label: 'Green', value: Colors.green),
                                Option(label: 'Yellow', value: Colors.yellow),
                                Option(label: 'Purple', value: Colors.purple),
                                Option(label: 'Orange', value: Colors.orange),
                                Option(label: 'Teal', value: Colors.teal),
                              ],
                            ),
                            content: TPETextGroup(
                              title: k.text(
                                label: 'Title',
                                initial: "Custom Configuration",
                              ),
                              description: k.text(
                                label: 'Description',
                                initial:
                                    "This is a fully customizable confirmation section with all options available for testing.",
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          : const Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TPEConfirmationSection(
                    imageUrl:
                        'packages/tpe_component_sdk/assets/images/img_account_blocked.png',
                    content: TPETextGroup(
                      title: "Account Access Blocked",
                      description:
                          "Your username or password was entered incorrectly 3 times. Recover your account below or check your email for further information.",
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
