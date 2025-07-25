import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/card/tpe_promo_banner/tpe_promo_card.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Base Card")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            TPEPromoCard(imageUrl: 'https://assets/images/Taiwan_card_image_2.png',)
          ],
        ),
      ),
    );
  }
}
