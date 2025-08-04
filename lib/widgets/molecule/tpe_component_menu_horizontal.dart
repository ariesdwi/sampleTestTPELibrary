import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentMenuHorizontal extends StatefulWidget {
  const TPEComponentMenuHorizontal({super.key});

  @override
  State<TPEComponentMenuHorizontal> createState() =>
      _TPEComponentMenuHorizontalState();
}

class _TPEComponentMenuHorizontalState extends State<TPEComponentMenuHorizontal> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Menu Horizontal"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Toggle Storybook',
            onPressed: () => setState(() => showStorybook = !showStorybook),
          ),
        ],
      ),
      body: showStorybook ? _buildStorybook() : _buildDefaultBody(),
    );
  }

  // =========================
  // Default (non-Storybook) body
  // =========================
  Widget _buildDefaultBody() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TPEHorizontalMenuItem(
              icon: const Icon(Icons.attach_money, color: Colors.blue),
              title: 'Transfer',
              subtitle: 'Transfer money securely to any domestic bank account',
              onTap: () {
                debugPrint('Transfer tapped');
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  // =========================
  // Storybook
  // =========================
  Widget _buildStorybook() {
    return Storybook(
      wrapperBuilder: (context, child) => Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
      stories: [
        // ------- SINGLE ITEM (CUSTOMIZABLE) -------
        Story(
          name: 'TPEHorizontalMenuItem / Single (Customizable)',
          builder: (context) {
            final title = context.knobs.text(
              label: 'Title',
              initial: 'Transfer',
            );

            final withSubtitle = context.knobs.boolean(
              label: 'Show Subtitle',
              initial: true,
            );

            final subtitleText = context.knobs.text(
              label: 'Subtitle Text',
              initial: 'Transfer money securely to any domestic bank account',
            );

            final iconChoice = context.knobs.options<IconData>(
              label: 'Icon',
              initial: Icons.attach_money,
              options: const [
                Option(label: 'Money', value: Icons.attach_money),
                Option(label: 'Send', value: Icons.send),
                Option(label: 'Payments', value: Icons.payments),
                Option(label: 'Credit Card', value: Icons.credit_card),
                Option(label: 'Account Balance', value: Icons.account_balance),
              ],
            );

            final iconColor = context.knobs.options<Color>(
              label: 'Icon Color',
              initial: Colors.blue,
              options: const [
                Option(label: 'Blue', value: Colors.blue),
                Option(label: 'Green', value: Colors.green),
                Option(label: 'Orange', value: Colors.orange),
                Option(label: 'Red', value: Colors.red),
                Option(label: 'Grey', value: Colors.grey),
                Option(label: 'Black', value: Colors.black),
              ],
            );

            final iconSize = context.knobs.slider(
              label: 'Icon Size',
              initial: 24,
              min: 16,
              max: 40,
            );

            final maxWidth = context.knobs.slider(
              label: 'Max Width',
              initial: 560,
              min: 320,
              max: 800,
            );

            // Always pass subtitle (required); hide by sending empty string when toggled off.
            final effectiveSubtitle = withSubtitle ? subtitleText : '';

            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: TPEHorizontalMenuItem(
                icon: Icon(iconChoice, color: iconColor, size: iconSize),
                title: title,
                subtitle: effectiveSubtitle,
                onTap: () => debugPrint('Single item tapped'),
              ),
            );
          },
        ),

        // ------- MULTI ITEM LIST (VARIANTS) -------
        Story(
          name: 'TPEHorizontalMenuItem / List (Variants)',
          builder: (context) {
            final itemCount = context.knobs
                .slider(label: 'Item Count', initial: 4, min: 1, max: 10)
                .toInt();

            final spacing = context.knobs.slider(
              label: 'Spacing between items',
              initial: 8,
              min: 0,
              max: 24,
            );

            final maxWidth = context.knobs.slider(
              label: 'Max Width',
              initial: 560,
              min: 320,
              max: 800,
            );

            final alternateSubtitles = context.knobs.boolean(
              label: 'Alternate subtitles',
              initial: true,
            );

            final defaultSubtitle = context.knobs.text(
              label: 'Default Subtitle',
              initial: 'Quick action with helpful context',
            );

            final iconSet = context.knobs.options<String>(
              label: 'Icon Set',
              initial: 'Finance',
              options: const [
                Option(label: 'Finance', value: 'Finance'),
                Option(label: 'Communication', value: 'Comms'),
              ],
            );

            final colorSet = context.knobs.options<String>(
              label: 'Icon Color Set',
              initial: 'Brand',
              options: const [
                Option(label: 'Brand', value: 'Brand'),
                Option(label: 'Greys', value: 'Greys'),
              ],
            );

            final iconSize = context.knobs.slider(
              label: 'Icon Size',
              initial: 22,
              min: 16,
              max: 40,
            );

            IconData iconFor(int i) {
              final idx = i % 5;
              if (iconSet == 'Comms') {
                switch (idx) {
                  case 0:
                    return Icons.chat_bubble_outline;
                  case 1:
                    return Icons.email_outlined;
                  case 2:
                    return Icons.call_outlined;
                  case 3:
                    return Icons.share_outlined;
                  default:
                    return Icons.message_outlined;
                }
              } else {
                // Finance
                switch (idx) {
                  case 0:
                    return Icons.attach_money;
                  case 1:
                    return Icons.account_balance;
                  case 2:
                    return Icons.credit_card;
                  case 3:
                    return Icons.payments;
                  default:
                    return Icons.send;
                }
              }
            }

            Color colorFor(int i) {
              final idx = i % 5;
              if (colorSet == 'Greys') {
                switch (idx) {
                  case 0:
                    return Colors.black87;
                  case 1:
                    return Colors.black54;
                  case 2:
                    return Colors.grey;
                  case 3:
                    return Colors.blueGrey;
                  default:
                    return Colors.black45;
                }
              } else {
                // Brand-like
                switch (idx) {
                  case 0:
                    return Colors.blue;
                  case 1:
                    return Colors.green;
                  case 2:
                    return Colors.orange;
                  case 3:
                    return Colors.purple;
                  default:
                    return Colors.red;
                }
              }
            }

            final children = <Widget>[];
            for (int i = 0; i < itemCount; i++) {
              final title = 'Menu ${i + 1}';
              // Always provide a subtitle (required). Optionally alternate between showing text and empty string.
              final subtitle =
                  (alternateSubtitles && i.isOdd) ? defaultSubtitle : '';

              children.add(
                TPEHorizontalMenuItem(
                  icon: Icon(iconFor(i), color: colorFor(i), size: iconSize),
                  title: title,
                  subtitle: subtitle,
                  onTap: () => debugPrint('Tapped menu ${i + 1}'),
                ),
              );

              if (i < itemCount - 1) {
                children.add(SizedBox(height: spacing));
              }
            }

            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            );
          },
        ),
      ],
    );
  }
}
