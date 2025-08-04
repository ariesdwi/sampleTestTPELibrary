import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';
import 'package:tpe_component_sdk/components/section/tpe_promo_section.dart';

class TPEOrganismPromoBanner extends StatefulWidget {
  const TPEOrganismPromoBanner({super.key});

  @override
  State<TPEOrganismPromoBanner> createState() => _TPEOrganismPromoBannerState();
}

class _TPEOrganismPromoBannerState extends State<TPEOrganismPromoBanner> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Promo Banner"),
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
              wrapperBuilder: (context, child) => Padding(
                padding: const EdgeInsets.all(8),
                child: Center(child: child),
              ),
              stories: [
                // ====== DEFAULT VARIANT ======
                Story(
                  name: 'TPEOrganismPromoBanner / Default',
                  builder: (context) {
                    final title = context.knobs.text(
                      label: 'Section Title',
                      initial: 'Transaction Menu',
                    );

                    final subtitle = context.knobs.text(
                      label: 'Section Subtitle',
                      initial: 'Manage your finances and account',
                    );

                    final image1 = context.knobs.text(
                      label: 'Image URL 1',
                      initial: 'assets/images/placeholder.png',
                    );

                    final image2 = context.knobs.text(
                      label: 'Image URL 2',
                      initial:
                          'https://hondapekalonganmotor.com/wp-content/uploads/2020/03/71044716-red-easy-vector-illustration-isolated-paper-bubble-banner-promo-this-element-is-well-adapted-for-web.jpg',
                    );

                    return TpePromoSection(
                      sectionHeaderPromo: TpeComponentSectionHeader(
                        title: title,
                        subtitle: subtitle,
                      ),
                      promoBannerTw: TpePromoListBannerTw(
                        imageUrls: [image1, image2],
                      ),
                    );
                  },
                ),

                // ====== SINGLE BANNER VARIANT ======
                Story(
                  name: 'TPEOrganismPromoBanner / Single Banner',
                  builder: (context) {
                    final title = context.knobs.text(
                      label: 'Section Title',
                      initial: 'Promo Deals',
                    );

                    final subtitle = context.knobs.text(
                      label: 'Section Subtitle',
                      initial: 'Best promotions for you',
                    );

                    final imageUrl = context.knobs.text(
                      label: 'Image URL',
                      initial:
                          'https://cdn-icons-png.flaticon.com/512/1040/1040230.png',
                    );

                    return TpePromoSection(
                      sectionHeaderPromo: TpeComponentSectionHeader(
                        title: title,
                        subtitle: subtitle,
                      ),
                      promoBannerTw: TpePromoListBannerTw(
                        imageUrls: [imageUrl],
                      ),
                    );
                  },
                ),
              ],
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TpePromoSection(
                  sectionHeaderPromo: const TpeComponentSectionHeader(
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
              ),
            ),
    );
  }
}
