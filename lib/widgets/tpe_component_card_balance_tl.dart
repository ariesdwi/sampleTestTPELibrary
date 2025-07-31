import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentCardBalanceTL extends StatefulWidget {
  const TPEComponentCardBalanceTL({super.key});

  @override
  State<TPEComponentCardBalanceTL> createState() =>
      _TPEComponentCardBalanceTLState();
}

class _TPEComponentCardBalanceTLState extends State<TPEComponentCardBalanceTL> {
  bool showStorybook = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Card Balance"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              setState(() => showStorybook = !showStorybook);
            },
          ),
        ],
      ),
      body: showStorybook
          ? Storybook(
              wrapperBuilder: (context, child) => Center(child: child),
              stories: [
                Story(
                  name: 'TPEBalanceCardTL / Customizable',
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

                    final isLoading = context.knobs.boolean(
                      label: 'isLoading',
                      initial: false,
                    );

                    return TPEBalanceCardTL(
                      accountNumber: accountNumber,
                      currency: currency,
                      currentBalance: currentBalance,
                      isLoading: isLoading,
                    );
                  },
                ),
                Story(
                  name: 'TPEBalanceCardTL / Loading demo (delayed)',
                  builder: (context) {
                    final delayMs = context.knobs.slider(
                      label: 'Loading Delay (ms)',
                      initial: 1000,
                      min: 100,
                      max: 5000,
                    ).toInt();

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

                    return _BalanceCardLoadingDemo(
                      delayMs: delayMs,
                      accountNumber: accountNumber,
                      currency: currency,
                      currentBalance: currentBalance,
                    );
                  },
                ),
              ],
            )
          : Center(
              child: TPEBalanceCardTL(
                accountNumber: '1234567890',
                currency: 'USD',
                currentBalance: 1234.56,
                isLoading: isLoading,
              ),
            ),
    );
  }
}

/// Small helper widget to simulate a loading period for the balance card,
/// with a button to restart the loading animation.
class _BalanceCardLoadingDemo extends StatefulWidget {
  const _BalanceCardLoadingDemo({
    required this.delayMs,
    required this.accountNumber,
    required this.currency,
    required this.currentBalance,
  });

  final int delayMs;
  final String accountNumber;
  final String currency;
  final double currentBalance;

  @override
  State<_BalanceCardLoadingDemo> createState() => _BalanceCardLoadingDemoState();
}

class _BalanceCardLoadingDemoState extends State<_BalanceCardLoadingDemo> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    setState(() => _isLoading = true);
    Future.delayed(Duration(milliseconds: widget.delayMs), () {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TPEBalanceCardTL(
          accountNumber: widget.accountNumber,
          currency: widget.currency,
          currentBalance: widget.currentBalance,
          isLoading: _isLoading,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _startLoading,
          child: const Text('Restart loading'),
        ),
      ],
    );
  }
}
