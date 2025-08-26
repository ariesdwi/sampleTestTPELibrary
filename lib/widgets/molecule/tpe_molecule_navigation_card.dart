// import 'package:flutter/material.dart';
// import 'package:storybook_flutter/storybook_flutter.dart';
// import 'package:tpe_component_sdk/components/button/tpe_navigation_card.dart';

// class NavigationButtonCard extends StatefulWidget {
//   const NavigationButtonCard({super.key});

//   @override
//   State<NavigationButtonCard> createState() => _NavigationButtonCardState();
// }

// class _NavigationButtonCardState extends State<NavigationButtonCard> {
//   bool showStorybook = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("TPE Navigation Card Button"),
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
//       body: showStorybook ? _buildStorybook() : _buildDefaultButton(),
//     );
//   }

//   Widget _buildDefaultButton() {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: TPENavigationCardButton(
//           text: 'Lihat semua rekeningmu',
//           onTap: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text("Lihat Semua Button pressed"),
//                 backgroundColor: Colors.green,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildStorybook() {
//     return Storybook(
//       wrapperBuilder: (context, child) => Padding(
//         padding: const EdgeInsets.all(16),
//         child: Center(child: child),
//       ),
//       stories: [
//         Story(
//           name: 'TPENavigationCardButton / Customizable',
//           builder: (context) {
//             final text = context.knobs.text(
//               label: 'Button Text',
//               initial: 'Lihat semua rekeningmu',
//             );

//             final enabled = context.knobs.boolean(
//               label: 'Enable Tap Handler',
//               initial: true,
//             );

//             return TPENavigationCardButton(
//               text: text,
//               onTap: () {
//                 if (enabled) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text("Lihat Semua Button pressed"),
//                       backgroundColor: Colors.green,
//                     ),
//                   );
//                 }
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/components/button/tpe_navigation_card.dart';

class NavigationButtonCard extends StatefulWidget {
  const NavigationButtonCard({super.key});

  @override
  State<NavigationButtonCard> createState() => _NavigationButtonCardState();
}

class _NavigationButtonCardState extends State<NavigationButtonCard> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Navigation Card Button"),
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
      body: showStorybook ? _buildStorybook() : _buildDefaultButton(),
    );
  }

  Widget _buildDefaultButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.blue[50], // Light blue background color
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TPENavigationCardButton(
              text: 'Lihat semua rekeningmu',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Lihat Semua Button pressed"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStorybook() {
    return Storybook(
      wrapperBuilder: (context, child) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(child: child),
      ),
      stories: [
        Story(
          name: 'TPENavigationCardButton / Customizable',
          builder: (context) {
            final text = context.knobs.text(
              label: 'Button Text',
              initial: 'Lihat semua rekeningmu',
            );

            final enabled = context.knobs.boolean(
              label: 'Enable Tap Handler',
              initial: true,
            );

            final cardColor = context.knobs.options(
              label: 'Card Color',
              initial: Colors.blue[50],
              options: [
                Option(label: 'Light Blue', value: Colors.blue[50]!),
                Option(label: 'Light Green', value: Colors.green[50]!),
                Option(label: 'Light Orange', value: Colors.orange[50]!),
                Option(label: 'White', value: Colors.white),
              ],
            );

            return Card(
              color: cardColor,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TPENavigationCardButton(
                  text: text,
                  onTap: () {
                    if (enabled) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Lihat Semua Button pressed"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
