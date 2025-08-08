import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TpeOrganismSingleButtonBottomSheet extends StatelessWidget {
  const TpeOrganismSingleButtonBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TPE Single Button BottomSheet"),
        ),
        body: Center(
            child: ElevatedButton(
          child: const Text("Show BottomSheet"),
          onPressed: () {
            showSingleButtonBottomSheetBase(
              context: context,
              buttonText: "Activate Registration",
              onButtonPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Primary button pressed"),
                  ),
                );
              },
              confirmationSection: TPEConfirmationSection(
                  content: TPETextGroup(
                      description:
                          "To open a new account, please visit BRI branch office. New account registrations can only be processed at our branch office.")),
            );
          },
        )));
  }
}
