import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentCardBalanceTW extends StatefulWidget {
  const TPEComponentCardBalanceTW({super.key});

  @override
  State<TPEComponentCardBalanceTW> createState() =>
      _TPEComponentCardBalanceTWState();
}

class _TPEComponentCardBalanceTWState extends State<TPEComponentCardBalanceTW> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Card Balance"),
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
        constraints: const BoxConstraints(maxWidth: 520),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          children: [
            TPEBalanceCardTW(
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1234.56,
              onSeeAll: () {
                debugPrint('See all tapped (default item 1)');
              },
            ),
            const SizedBox(height: 12),
            TPEBalanceCardTW(
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1234.56,
              backgroundColor: TPEColors.blue80, // non-nullable
              balanceIndicator:
                  const TPEBalanceIndicator(color: TPEColors.white),
            ),
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
        // ------- SINGLE CARD CUSTOMIZABLE -------
        Story(
          name: 'TPEBalanceCardTW / Single (Customizable)',
          builder: (context) {
            final accountNumber = context.knobs.text(
              label: 'Account Number',
              initial: '1234567890',
            );

            final currency = context.knobs.options<String>(
              label: 'Currency',
              initial: 'USD',
              options: const [
                Option(label: 'USD', value: 'USD'),
                Option(label: 'IDR', value: 'IDR'),
                Option(label: 'EUR', value: 'EUR'),
                Option(label: 'GBP', value: 'GBP'),
                Option(label: 'JPY', value: 'JPY'),
              ],
            );

            final currentBalance = context.knobs.slider(
              label: 'Current Balance',
              initial: 1234.56,
              min: 0,
              max: 100000,
            );

            // --- Background color handling: avoid passing null to non-nullable Color
            final useDefaultBackground = context.knobs.boolean(
              label: 'Use default background',
              initial: true,
            );
            final chosenBg = context.knobs.options<Color>(
              label: 'Background Color (when not default)',
              initial: TPEColors.blue80,
              options: const [
                Option(label: 'White', value: TPEColors.white),
                Option(label: 'Blue80', value: TPEColors.blue80),
                Option(label: 'Grey20', value: TPEColors.dark10),
              ],
            );

            // --- Optional balance indicator
            final useCustomIndicator = context.knobs.boolean(
              label: 'Use custom indicator',
              initial: false,
            );
            final indicatorItemCount = context.knobs
                .slider(
                  label: 'Indicator Item Count',
                  initial: 5,
                  min: 1,
                  max: 10,
                )
                .toInt();
            final indicatorSize = context.knobs.slider(
              label: 'Indicator Dot Size',
              initial: 12,
              min: 4,
              max: 30,
            );
            final indicatorSpacing = context.knobs.slider(
              label: 'Indicator Spacing',
              initial: 8,
              min: 0,
              max: 30,
            );
            final indicatorColor = context.knobs.options<Color>(
              label: 'Indicator Color',
              initial: TPEColors.blue80,
              options: const [
                Option(label: 'Blue80', value: TPEColors.blue80),
                Option(label: 'White', value: TPEColors.white),
                Option(label: 'Grey', value: Colors.grey),
                Option(label: 'Green', value: Colors.green),
                Option(label: 'Orange', value: Colors.orange),
                Option(label: 'Red', value: Colors.red),
              ],
            );

            final indicator = TPEBalanceIndicator(
              itemCount: indicatorItemCount,
              size: indicatorSize,
              spacing: indicatorSpacing,
              color: indicatorColor,
            );

            // Conditionally include named args (never pass null to non-nullable)
            if (useDefaultBackground && !useCustomIndicator) {
              return _cardSingle(
                accountNumber: accountNumber,
                currency: currency,
                currentBalance: currentBalance,
              );
            } else if (useDefaultBackground && useCustomIndicator) {
              return _cardSingle(
                accountNumber: accountNumber,
                currency: currency,
                currentBalance: currentBalance,
                balanceIndicator: indicator,
              );
            } else if (!useDefaultBackground && !useCustomIndicator) {
              return _cardSingle(
                accountNumber: accountNumber,
                currency: currency,
                currentBalance: currentBalance,
                backgroundColor: chosenBg,
              );
            } else {
              return _cardSingle(
                accountNumber: accountNumber,
                currency: currency,
                currentBalance: currentBalance,
                backgroundColor: chosenBg,
                balanceIndicator: indicator,
              );
            }
          },
        ),

        // ------- MULTI-CARD LIST VARIANT -------
        Story(
          name: 'TPEBalanceCardTW / List (Variants)',
          builder: (context) {
            final itemCount = context.knobs
                .slider(label: 'Item Count', initial: 3, min: 1, max: 8)
                .toInt();

            final alternateBackgrounds = context.knobs.boolean(
              label: 'Alternate Backgrounds',
              initial: true,
            );

            final alternateIndicators = context.knobs.boolean(
              label: 'Alternate Indicators',
              initial: true,
            );

            final enableSeeAll = context.knobs.boolean(
              label: 'Enable onSeeAll (all items)',
              initial: true,
            );

            final baseBalance = context.knobs.slider(
              label: 'Base Balance',
              initial: 1200,
              min: 0,
              max: 100000,
            );

            return ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < itemCount; i++) ...[
                    _cardListVariant(
                      index: i,
                      accountNumber: '123456789${i % 10}',
                      currency: i.isEven ? 'USD' : 'IDR',
                      currentBalance: baseBalance + (i * 73.25),
                      useBg: alternateBackgrounds ? i.isOdd : false,
                      useIndicator: alternateIndicators ? i.isOdd : false,
                      onSeeAll: enableSeeAll
                          ? () => debugPrint('See all tapped on item $i')
                          : null,
                    ),
                    if (i < itemCount - 1) const SizedBox(height: 12),
                  ],
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // =========================
  // Small helpers to reduce duplication in stories
  // =========================

  Widget _cardSingle({
    required String accountNumber,
    required String currency,
    required double currentBalance,
    Color? backgroundColor, // pass only when not null (non-nullable at the call site)
    TPEBalanceIndicator? balanceIndicator, // pass only when not null
    VoidCallback? onSeeAll,
  }) {
    if (backgroundColor == null && balanceIndicator == null) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: TPEBalanceCardTW(
          accountNumber: accountNumber,
          currency: currency,
          currentBalance: currentBalance,
          onSeeAll: onSeeAll ?? () => debugPrint('See all tapped'),
        ),
      );
    } else if (backgroundColor == null && balanceIndicator != null) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: TPEBalanceCardTW(
          accountNumber: accountNumber,
          currency: currency,
          currentBalance: currentBalance,
          balanceIndicator: balanceIndicator,
          onSeeAll: onSeeAll ?? () => debugPrint('See all tapped'),
        ),
      );
    } else if (backgroundColor != null && balanceIndicator == null) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: TPEBalanceCardTW(
          accountNumber: accountNumber,
          currency: currency,
          currentBalance: currentBalance,
          backgroundColor: backgroundColor, // non-nullable provided
          onSeeAll: onSeeAll ?? () => debugPrint('See all tapped'),
        ),
      );
    } else {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: TPEBalanceCardTW(
          accountNumber: accountNumber,
          currency: currency,
          currentBalance: currentBalance,
          backgroundColor: backgroundColor!, // safe due to branch
          balanceIndicator: balanceIndicator,
          onSeeAll: onSeeAll ?? () => debugPrint('See all tapped'),
        ),
      );
    }
  }

  Widget _cardListVariant({
    required int index,
    required String accountNumber,
    required String currency,
    required double currentBalance,
    required bool useBg,
    required bool useIndicator,
    VoidCallback? onSeeAll,
  }) {
    if (useBg && useIndicator) {
      return TPEBalanceCardTW(
        accountNumber: accountNumber,
        currency: currency,
        currentBalance: currentBalance,
        backgroundColor: TPEColors.blue80, // Color (non-nullable)
        balanceIndicator: const TPEBalanceIndicator(color: TPEColors.white),
        onSeeAll: onSeeAll,
      );
    } else if (useBg && !useIndicator) {
      return TPEBalanceCardTW(
        accountNumber: accountNumber,
        currency: currency,
        currentBalance: currentBalance,
        backgroundColor: TPEColors.blue80,
        onSeeAll: onSeeAll,
      );
    } else if (!useBg && useIndicator) {
      return TPEBalanceCardTW(
        accountNumber: accountNumber,
        currency: currency,
        currentBalance: currentBalance,
        balanceIndicator: const TPEBalanceIndicator(color: TPEColors.white),
        onSeeAll: onSeeAll,
      );
    } else {
      return TPEBalanceCardTW(
        accountNumber: accountNumber,
        currency: currency,
        currentBalance: currentBalance,
        onSeeAll: onSeeAll,
      );
    }
  }
}
