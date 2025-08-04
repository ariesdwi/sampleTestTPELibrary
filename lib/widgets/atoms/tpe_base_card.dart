// import 'package:flutter/material.dart';
// import 'package:tpe_component_sdk/components/card/tpe_promo_banner/tpe_promo_card.dart';

// class BaseCard extends StatelessWidget {
//   const BaseCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("TPE Base Card")),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: const [
//             TPEPromoCard(
//               imageUrl:
//                   'https://hondapekalonganmotor.com/wp-content/uploads/2020/03/71044716-red-easy-vector-illustration-isolated-paper-bubble-banner-promo-this-element-is-well-adapted-for-web.jpg',
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/components/card/tpe_promo_banner/tpe_promo_card.dart';

class BaseCard extends StatefulWidget {
  const BaseCard({super.key});

  @override
  State<BaseCard> createState() => _BaseCardState();
}

class _BaseCardState extends State<BaseCard> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Base Card"),
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
      body: showStorybook ? _buildStorybook() : _buildDefaultView(),
    );
  }

  Widget _buildDefaultView() {
    return const Center(
      child: TPEPromoCard(
        imageUrl:
            'https://hondapekalonganmotor.com/wp-content/uploads/2020/03/71044716-red-easy-vector-illustration-isolated-paper-bubble-banner-promo-this-element-is-well-adapted-for-web.jpg',
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
          name: 'TPEPromoCard / Customizable',
          builder: (context) {
            final imageUrl = context.knobs.text(
              label: 'Image URL',
              initial:
                  'https://hondapekalonganmotor.com/wp-content/uploads/2020/03/71044716-red-easy-vector-illustration-isolated-paper-bubble-banner-promo-this-element-is-well-adapted-for-web.jpg',
            );

            return TPEPromoCard(imageUrl: imageUrl);
          },
        ),
      ],
    );
  }
}
