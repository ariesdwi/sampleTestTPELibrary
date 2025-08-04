import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({super.key});

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Transaction Item"),
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
      body: showStorybook ? _buildStorybook() : _buildTransactionItem(),
    );
  }

  Widget _buildTransactionItem() {
    return Center(
      child: TpeTransactionItemTw(
        isLoading: false,
        activityTitle: 'Transfer to BRI',
        activityText: 'Transfer to BRI',
        activityAmount: 'Rp 1.000.000',
        activityDate: '12 Jan 2023',
        activityIcon: 'assets/images/TRANSFER_NEW.png',
        activityStatus: 2,
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
          name: 'TpeTransactionItemTw / Customizable',
          builder: (context) {
            final isLoading = context.knobs.boolean(label: 'Loading', initial: false);
            final title = context.knobs.text(label: 'Title', initial: 'Transfer to BRI');
            final text = context.knobs.text(label: 'Text', initial: 'Transfer to BRI');
            final amount = context.knobs.text(label: 'Amount', initial: 'Rp 1.000.000');
            final date = context.knobs.text(label: 'Date', initial: '12 Jan 2023');
            final icon = context.knobs.text(
              label: 'Icon Path or URL',
              initial: 'assets/images/TRANSFER_NEW.png',
            );
            final status = context.knobs.options<int>(
              label: 'Activity Status',
              initial: 2,
              options: const [
                Option(label: 'Pending', value: 1),
                Option(label: 'Success', value: 2),
                Option(label: 'Failed', value: 3),
              ],
            );

            return TpeTransactionItemTw(
              isLoading: isLoading,
              activityTitle: title,
              activityText: text,
              activityAmount: amount,
              activityDate: date,
              activityIcon: icon,
              activityStatus: status,
            );
          },
        ),
      ],
    );
  }
}
