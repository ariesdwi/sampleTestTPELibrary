
import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentMenuHorizontalPage extends StatelessWidget {
  const TPEComponentMenuHorizontalPage({super.key});

  List<TPEHorizontalMenuItem> get menuItems => const [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vertical List of Horizontal Cards")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: menuItems.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: item.onTap,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
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
        ),
      ),
    );
  }
}

