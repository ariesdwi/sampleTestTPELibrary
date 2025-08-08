import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart'; // adjust path if needed

class BlueBackgroundWithCardPage extends StatelessWidget {
  final String? backgroundUrl;
  final AlignmentGeometry backgroundAlignment;
  final String title;
  final String subtitle;
  final String loginText;
  final VoidCallback onLoginTap;
  final VoidCallback onRegisterTap;

  const BlueBackgroundWithCardPage({
    super.key,
    this.backgroundUrl,
    this.backgroundAlignment = Alignment.center,
    required this.title,
    required this.subtitle,
    required this.loginText,
    required this.onLoginTap,
    required this.onRegisterTap,
  });

  // Show image from network if available, else show asset fallback
  Widget _buildNetworkImage() {
    return Image.network(
      backgroundUrl!,
      fit: BoxFit.contain,
      alignment: backgroundAlignment,
      errorBuilder: (context, error, stackTrace) => _buildAssetImage(),
    );
  }

  Widget _buildAssetImage() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Align(
        alignment: backgroundAlignment,
        child: Image.asset(
          'packages/tpe_login_sdk/assets/images/onboarding_illustration.png',
          fit: BoxFit.contain,
          alignment: backgroundAlignment,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TPEColors.blue70, // Blue background
      body: Stack(
        children: [
          // Blue background layer
          Container(color: TPEColors.blue70),

          // Image layer (either network or asset)
          Align(
            alignment: backgroundAlignment,
            child: backgroundUrl != null
                ? _buildNetworkImage()
                : _buildAssetImage(),
          ),

          // White card at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TPEText(
                    text: title,
                    variant: TPETextVariant.text16Bold,
                    color: TPEColors.black,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  TPEText(
                    text: subtitle,
                    variant: TPETextVariant.secondary,
                    color: TPEColors.black,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  TPERefineButton(
                    title: loginText,
                    variant: TPEButtonVariant.primary,
                    size: TPEButtonSize.medium,
                    roundType: TPEButtonRound.rounded,
                    isCentered: true,
                    isEnabled: true,
                    onPressed: onLoginTap,
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      TPEText(
                        text: "Don't have account? ",
                        variant: TPETextVariant.secondary,
                        color: TPEColors.black,
                      ),
                      TPELinkText(
                        text: "Registration Account",
                        color: TPEColors.blue70,
                        onTap: onRegisterTap,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
