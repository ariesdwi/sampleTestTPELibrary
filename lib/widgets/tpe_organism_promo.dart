

import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/card/tpe_promo_banner/tpe_component_promo_banner.dart';

class TPEOrganismPromoBanner extends StatelessWidget {
  const TPEOrganismPromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Section")),
      body: Center(
        child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TpePromoBannerTw(
              imageUrls: [
                'assets/images/placeholder.png',
                'assets/images/placeholder.png',
                'assets/images/placeholder.png',
                'assets/images/placeholder.png',
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}