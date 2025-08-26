import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TpeOrganismPrimarySecondaryBs extends StatelessWidget {
  const TpeOrganismPrimarySecondaryBs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TPE Primary Secondary BottomSheet"),
        ),
        body: Center(
            child: ElevatedButton(
          child: const Text("Show BottomSheet"),
          onPressed: () {
            showTPEPrimarySecondaryBottomSheetBase(
                context: context,
                confirmationSection: TPEConfirmationSection(
                    imageUrl:
                        "packages/tpe_component_sdk/assets/images/img_account_blocked.png",
                    content: TPETextGroup(
                        title: "Account Access Blocked",
                        description:
                            "Your username, or password was Inputed incorrectly 3 times. Recover your account below or check your email for further information.")),
                primarySecondaryButton: TPEPrimarySecondaryButton(
                  primaryButtonText: "Recover Your Account",
                  secondaryButtonText: "Not Now",
                  onPrimaryButtonPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Primary button pressed"),
                      ),
                    );
                  },
                  onSecondaryButtonPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Secondary button pressed"),
                      ),
                    );
                  },
                ));
          },
        )));
  }
}
