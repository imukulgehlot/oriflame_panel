import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/basic_features.dart';
import 'package:oriflame_panel/core/widgets/common/cutom_app_bar.dart';

class AIConsoleTab extends StatelessWidget {
  const AIConsoleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppString.aiConsole),
      body: Center(
        child: Text(AppString.aiConsole),
      ),
    );
  }
}
