import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TextVariant extends StatelessWidget {
  const TextVariant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("TPE Text Variant")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            TPEText(text: "Default Text"),
            TPEText(text: "Primary Text", variant: TPETextVariant.primary),
            TPEText(text: "Secondary Text", variant: TPETextVariant.secondary),
            TPEText(text: "12 bold", variant: TPETextVariant.text12bold),
            TPEText(text: "14 semibold 600 ", variant: TPETextVariant.text14SemiBold600, color: Colors.blue,),
            TPEText(text: "14 semibold 700", variant: TPETextVariant.text14SemiBold700),
            TPEText(text: "16 bold", variant: TPETextVariant.text16Bold),
            TPEText(text: "20 semi bold 700", variant: TPETextVariant.text20SemiBold700),
          ],
        ),
      ),
    );
  }
}
