import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/icon/tpe_icon_base.dart';

class BaseIcon extends StatelessWidget {
  const BaseIcon({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("TPE Base Icon")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  [
            TPEBaseIconUrl(
              iconUrl: 'https://cdn-icons-png.flaticon.com/512/3449/3449748.png',
              size: 40,
              color: Colors.blue,
            ),
            SizedBox(height: 8,),
            TPEBaseIconUrl(
              iconUrl: 'https://cdn-icons-png.flaticon.com/512/3186/3186949.png',
              size: 40,
              color: Colors.red,
            ),
            SizedBox(height: 8,),
            TPEBaseIconUrl(
              iconUrl: 'https://cdn-icons-png.flaticon.com/512/18717/18717283.png',
              size: 40,
              color: Colors.green,)
          ],
        ),
      ),
    );
  }
}
