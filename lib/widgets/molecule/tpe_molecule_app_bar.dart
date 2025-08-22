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
        title: const Text("TPE App Bar Storybook"),
        actions: [
          IconButton(
            icon: Icon(showStorybook ? Icons.settings : Icons.settings),
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
              initialStory: 'Basic/Default',
              stories: [
                // 📌 Basic Stories
                Story(
                  name: 'Basic/Default',
                  description: 'Default TPEAppBar with minimal configuration',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title: 'Default AppBar',
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                Story(
                  name: 'Basic/Custom Title',
                  description: 'AppBar with different title text',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title: 'My Custom Title',
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                // 📌 Navigation Stories
                Story(
                  name: 'Navigation/With Back Button (Default)',
                  description:
                      'Default back button behavior with pop navigation',
                  builder: (context) => Scaffold(
                    appBar: TPEAppBar(
                      title: 'Settings',
                      useBackButton: true,
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                Story(
                  name: 'Navigation/With Custom Back Action',
                  description: 'Back button with custom onPressed callback',
                  builder: (context) => Scaffold(
                    appBar: TPEAppBar(
                      title: 'Custom Action',
                      useBackButton: true,
                      onPressed: () {
                        debugPrint("Custom back action executed!");
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Custom back action!')),
                        );
                      },
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                Story(
                  name: 'Navigation/Without Back Button',
                  description: 'AppBar with disabled back button',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title: 'No Back Button',
                      useBackButton: false,
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                Story(
                  name: 'Navigation/Auto Imply Leading False',
                  description:
                      'AppBar with automaticallyImplyLeading set to false',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title: 'No Auto Leading',
                      automaticallyImplyLeading: false,
                      useBackButton: true,
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                // 📌 Customization Stories
                Story(
                  name: 'Customization/Different Background Colors',
                  description: 'AppBar with various background colors',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title: 'Colored AppBar',
                      backgroundColor: Colors.deepPurple,
                      useBackButton: true,
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                Story(
                  name: 'Customization/Red Background',
                  description: 'AppBar with red background color',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title: 'Red AppBar',
                      backgroundColor: Colors.red,
                      useBackButton: true,
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                Story(
                  name: 'Customization/Green Background',
                  description: 'AppBar with green background color',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title: 'Green AppBar',
                      backgroundColor: Colors.green,
                      useBackButton: true,
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                Story(
                  name: 'Customization/Default Blue70',
                  description: 'AppBar with default blue70 background',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title: 'Default Blue',
                      backgroundColor: TPEColors.blue70,
                      useBackButton: true,
                    ),
                    body: const Center(child: Text("Content goes here")),
                  ),
                ),

                // 📌 Edge Cases
                Story(
                  name: 'Edge Cases/Empty Title',
                  description: 'AppBar with empty title string',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title: '',
                      useBackButton: true,
                    ),
                    body: const Center(child: Text("Empty title example")),
                  ),
                ),

                Story(
                  name: 'Edge Cases/Very Long Title',
                  description: 'AppBar with very long title text',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title:
                          'This is an extremely long title that should demonstrate text truncation behavior in the app bar component',
                      useBackButton: true,
                    ),
                    body: const Center(child: Text("Long title example")),
                  ),
                ),

                Story(
                  name: 'Edge Cases/Special Characters',
                  description: 'AppBar with special characters in title',
                  builder: (context) => Scaffold(
                    appBar: const TPEAppBar(
                      title: 'AppBar! @#\$%^&*()_+{}[]:;",.<>?/',
                      useBackButton: true,
                    ),
                    body:
                        const Center(child: Text("Special characters example")),
                  ),
                ),

                // 📌 Interactive Playground
                Story(
                  name: 'Playground/Interactive Knobs',
                  description:
                      'Interactive playground to test all TPEAppBar properties',
                  builder: (context) {
                    final k = context.knobs;

                    final backgroundColor = k.options(
                      label: 'Background Color',
                      initial: TPEColors.blue70,
                      options: const [
                        Option(
                            label: 'Blue70 (Default)', value: TPEColors.blue70),
                        Option(label: 'Red', value: Colors.red),
                        Option(label: 'Green', value: Colors.green),
                        Option(label: 'Orange', value: Colors.orange),
                        Option(label: 'Purple', value: Colors.purple),
                        Option(label: 'Teal', value: Colors.teal),
                        Option(label: 'Black', value: Colors.black),
                      ],
                    );

                    final useBackButton = k.boolean(
                      label: 'Use Back Button',
                      initial: true,
                    );

                    // Hidden configurations (not shown in knobs but used internally)
                    const automaticallyImplyLeading = false;
                    const enableCustomAction = false;

                    return Scaffold(
                      appBar: TPEAppBar(
                        title: k.text(
                          label: 'Title',
                          initial: 'Interactive AppBar',
                        ),
                        useBackButton: useBackButton,
                        automaticallyImplyLeading: automaticallyImplyLeading,
                        backgroundColor: backgroundColor,
                        onPressed: enableCustomAction
                            ? () {
                                debugPrint("Custom back action from knobs!");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Custom action triggered!')),
                                );
                              }
                            : null,
                      ),
                      body: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.tune,
                                size: 48, color: Colors.blue),
                            const SizedBox(height: 16),
                            const Text(
                              "Interactive Playground",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Use the knobs panel to modify properties:",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Current Configuration:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text('Back Button: $useBackButton'),
                                  Text(
                                      'Background: ${backgroundColor.toString()}'),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                  Icon(Icons.auto_awesome, size: 64, color: Colors.blue),
                  SizedBox(height: 20),
                  Text(
                    "TPE App Bar Component",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Explore the capabilities of our custom AppBar",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 30),
                  TPEAppBar(
                    title: 'Live Preview',
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Tap the settings icon above to open Storybook",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
    );
  }
}
