import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';
import 'package:tpe_component_sdk/components/section/tpe_transaction_section.dart';

class TransactionItemList extends StatefulWidget {
  const TransactionItemList({super.key});

  @override
  State<TransactionItemList> createState() => _TransactionItemListState();
}

class _TransactionItemListState extends State<TransactionItemList> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Transaction List"),
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
              wrapperBuilder: (context, child) => Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: child,
              )),
              stories: [
                Story(
                  name: 'TpeTransactionSection / With Header and Items',
                  builder: (context) {
                    final status = context.knobs.options(
                      label: 'Status',
                      initial: 1,
                      options: const [
                        Option(label: 'Success', value: 1),
                        Option(label: 'Pending', value: 2),
                        Option(label: 'Failed', value: 3),
                      ],
                    );

                    final isLoading = context.knobs.boolean(
                      label: 'Is Loading',
                      initial: false,
                    );

                    final title = context.knobs.text(
                      label: 'Activity Title',
                      initial: 'Transfer to BRI',
                    );

                    final amount = context.knobs.text(
                      label: 'Amount',
                      initial: 'Rp 1.000.000',
                    );

                    return TpeTransactionSection(
                      sectionHeader: TpeComponentSectionHeader(
                        leadingIcon: TPEBaseIconUrl(
                          iconUrl: 'https://cdn-icons-png.flaticon.com/512/4256/4256863.png',
                        ),
                        title: 'Transaction Menu',
                        subtitle: 'Manage your finances and account',
                        trailingIcon: const Icon(Icons.chevron_right),
                        onTap: () => debugPrint("Transaction Menu tapped"),
                      ),
                      listTransaction: [
                        TpeTransactionItemTw(
                          isLoading: isLoading,
                          activityTitle: title,
                          activityText: title,
                          activityAmount: amount,
                          activityDate: '12 Jan 2023',
                          activityIcon: 'https://cdn-icons-png.flaticon.com/512/709/709496.png',
                          activityStatus: status,
                        ),
                      ],
                    );
                  },
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TpeTransactionSection(
                    sectionHeader: TpeComponentSectionHeader(
                      leadingIcon: TPEBaseIconUrl(
                        iconUrl: 'https://cdn-icons-png.flaticon.com/512/4256/4256863.png',
                      ),
                      title: 'Transaction Menu',
                      subtitle: 'Manage your finances and account',
                      trailingIcon: const Icon(Icons.chevron_right),
                      onTap: () => debugPrint("Transaction Menu tapped"),
                    ),
                    listTransaction: const [
                      TpeTransactionItemTw(
                        isLoading: false,
                        activityTitle: 'Transfer to BRI',
                        activityText: 'Transfer to BRI',
                        activityAmount: 'Rp 1.000.000',
                        activityDate: '12 Jan 2023',
                        activityIcon:
                            'https://hondapekalonganmotor.com/wp-content/uploads/2020/03/71044716-red-easy-vector-illustration-isolated-paper-bubble-banner-promo-this-element-is-well-adapted-for-web.jpg',
                        activityStatus: 1,
                      ),
                      TpeTransactionItemTw(
                        isLoading: false,
                        activityTitle: 'Transfer to BRI',
                        activityText: 'Transfer to BRI',
                        activityAmount: 'Rp 1.000.000',
                        activityDate: '12 Jan 2023',
                        activityIcon: 'assets/images/TRANSFER_NEW.png',
                        activityStatus: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
