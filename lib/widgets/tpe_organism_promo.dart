import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/card/tpe_promo_banner/tpe_component_promo_banner.dart';
import 'package:tpe_component_sdk/components/section/tpe_component_section_header.dart';
import 'package:tpe_component_sdk/components/section/tpe_promo_section.dart';

class TPEOrganismPromoBanner extends StatelessWidget {
  const TPEOrganismPromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Promo Banner")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TpePromoSection(
                sectionHeaderPromo: TpeComponentSectionHeader(
                  title: 'Transaction Menu',
                  subtitle: 'Manage your finances and account',
                ),
                promoBannerTw: TpePromoListBannerTw(
                  imageUrls: [
                    'assets/images/placeholder.png',
                    'https://hondapekalonganmotor.com/wp-content/uploads/2020/03/71044716-red-easy-vector-illustration-isolated-paper-bubble-banner-promo-this-element-is-well-adapted-for-web.jpg',
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
