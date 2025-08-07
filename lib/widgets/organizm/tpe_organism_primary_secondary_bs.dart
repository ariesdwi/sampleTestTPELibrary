import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/bottomsheet/tpe_primary_secondary_bottom_sheet_base.dart';
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
                    imageUrl: 'DFSFSDFSFSDS',
                    content: TPETextGroup(
                        title: "Account Access Blocked",
                        description:
                            "Your username, or password was Inputed incorrectly 3 times. Recover your account below or check your email for further information.")),
                primarySecondaryButton: TPEPrimarySecondaryButton(
                    primaryButtonText: "Recover Your Account",
                    secondaryButtonText: "Not Now"));
          },
        )));
  }
}
