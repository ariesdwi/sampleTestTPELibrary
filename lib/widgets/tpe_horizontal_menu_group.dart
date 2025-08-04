// import 'package:flutter/material.dart';
// import 'package:tpe_component_sdk/tpe_component_sdk.dart';

// class TPEComponentMenuHorizontalPage extends StatelessWidget {
//   const TPEComponentMenuHorizontalPage({super.key});

//   List<TPEHorizontalMenuItem> get menuItems => const [
//         TPEHorizontalMenuItem(
//           icon: Icon(Icons.send),
//           title: 'Transfer',
//           subtitle: "Transfer money securely to any domestic bank account",
//           onTap: null,
//         ),
//         TPEHorizontalMenuItem(
//           icon: Icon(Icons.account_balance),
//           title: 'Account',
//           subtitle: "Check your account details and balance",
//           onTap: null,
//         ),
//         TPEHorizontalMenuItem(
//           icon: Icon(Icons.account_balance_wallet),
//           title: 'Account Statement',
//           subtitle: "Download your Account Statement",
//           onTap: null,
//         ),
//         TPEHorizontalMenuItem(
//           icon: Icon(Icons.qr_code_scanner),
//           title: 'QR Transfer',
//           subtitle: "Send money instantly by scanning QR codes",
//           onTap: null,
//         ),
//       ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Vertical List of Horizontal Cards")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView.separated(
//           itemCount: menuItems.length,
//           separatorBuilder: (_, __) => const SizedBox(height: 16),
//           itemBuilder: (context, index) {
//             final item = menuItems[index];
//             return GestureDetector(
//               onTap: item.onTap,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 6,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     item.icon,
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             item.title,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             item.subtitle,
//                             style: const TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                             ),
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Icon(Icons.chevron_right),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentMenuHorizontalPage extends StatefulWidget {
  const TPEComponentMenuHorizontalPage({super.key});

  @override
  State<TPEComponentMenuHorizontalPage> createState() =>
      _TPEComponentMenuHorizontalPageState();
}

class _TPEComponentMenuHorizontalPageState
    extends State<TPEComponentMenuHorizontalPage> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Horizontal Menu List"),
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
      body:
          showStorybook ? _buildStorybook() : _buildMenuList(defaultMenuItems),
    );
  }

  Widget _buildStorybook() {
    return Storybook(
      wrapperBuilder: (context, child) => Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
      stories: [
        Story(
          name: 'TPEComponentMenuHorizontal / Customizable Items',
          builder: (context) {
            final itemCount = context.knobs.sliderInt(
                label: 'Number of Menu Items', initial: 2, max: 5, min: 1);

            final items =
                List<TPEHorizontalMenuItem>.generate(itemCount, (index) {
              final title = context.knobs.text(
                label: 'Item ${index + 1} Title',
                initial: 'Menu ${index + 1}',
              );

              final subtitle = context.knobs.text(
                label: 'Item ${index + 1} Subtitle',
                initial: 'Description for Menu ${index + 1}',
              );

              // Optional: static icon for now
              final icon = _iconByIndex(index);

              return TPEHorizontalMenuItem(
                icon: icon,
                title: title,
                subtitle: subtitle,
                onTap: () {
                  debugPrint('Tapped $title');
                },
              );
            });

            return _buildMenuList(items);
          },
        ),
      ],
    );
  }

  Widget _buildMenuList(List<TPEHorizontalMenuItem> items) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: item.onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                item.icon,
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
          ),
        );
      },
    );
  }

  List<TPEHorizontalMenuItem> get defaultMenuItems => const [
        TPEHorizontalMenuItem(
          icon: Icon(Icons.send),
          title: 'Transfer',
          subtitle: "Transfer money securely to any domestic bank account",
          onTap: null,
        ),
        TPEHorizontalMenuItem(
          icon: Icon(Icons.account_balance),
          title: 'Account',
          subtitle: "Check your account details and balance",
          onTap: null,
        ),
        TPEHorizontalMenuItem(
          icon: Icon(Icons.account_balance_wallet),
          title: 'Account Statement',
          subtitle: "Download your Account Statement",
          onTap: null,
        ),
        TPEHorizontalMenuItem(
          icon: Icon(Icons.qr_code_scanner),
          title: 'QR Transfer',
          subtitle: "Send money instantly by scanning QR codes",
          onTap: null,
        ),
      ];

  Icon _iconByIndex(int index) {
    const icons = [
      Icons.send,
      Icons.account_balance,
      Icons.account_balance_wallet,
      Icons.qr_code_scanner,
      Icons.credit_card,
    ];
    return Icon(icons[index % icons.length]);
  }
}

