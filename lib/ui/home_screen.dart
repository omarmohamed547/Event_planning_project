import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String homeScreenId = "HomeScreen";
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AssetManager.appbarImageProfile),
      ),
    );
  }
}
